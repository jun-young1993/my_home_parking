import { Canvas, useThree } from "@react-three/fiber";
import { OrbitControls, Html, TransformControls } from "@react-three/drei";
import { useEffect, useRef, useState } from "react";
import ParkingGround from "./parking/parking-ground";
import { Pillar, House, Car, ParkingSpace } from "./three-object";
import { Group } from "three";

interface ParkingSpotProps {
  position: [number, number, number];
  isOccupied?: boolean;
  spotNumber: string;
}

interface RoadProps {
  position: [number, number, number];
  size: [number, number, number];
  rotation?: [number, number, number];
}



interface SelectableObjectProps {
  object: React.ReactNode;
  onClick: () => void;
  isSelected: boolean;
  key?: number;
}

const SelectableObject: React.FC<SelectableObjectProps> = ({ object, onClick, isSelected }) => {
  const objectRef = useRef<Group>(null);

  return (
    <group onClick={(e) => {
      e.stopPropagation();
      onClick();
    }}>
      <group ref={objectRef}>
        {object}
      </group>
          {isSelected && objectRef.current && (
              <>
                    <TransformControls object={objectRef.current} showY={false} mode="translate" />
                  <TransformControls object={objectRef.current} mode="rotate" showX={false} showZ={false} />
                  </>
      )}
    </group>
  );
};

interface ThreeObject {
  id: number;
  type: string;
  position: [number, number, number];
}

// window 인터페이스 확장 추가
declare global {
  interface Window {
    flutter_inappwebview: {
      postMessage: (message: any) => void;
    };
  }
}

const ThreeEditor: React.FC = () => {
  const [objects, setObjects] = useState<ThreeObject[]>([]);
    const [selectedId, setSelectedId] = useState<number | null>(null);
    const {scene} = useThree();


  useEffect(() => {
    const handleMessage = (event: MessageEvent) => {
      if (event.data.type === 'objectSelection') {
        const { objectType } = event.data.data;
        // Three.js 오브젝트 생성 로직
        console.log('Selected object:', objectType);
        // 새 오브젝트 추가

        setObjects((prev: ThreeObject[]) => [...prev, {
          id: Date.now(),
          type: objectType,
          position: [0, 0, 0]
        }]);
      }
        if (event.data.type === 'getAllObjects') {
            function getAllObjects() {
                    // Three.js나 다른 3D 라이브러리에서 객체 정보 가져오기
                    const objects = scene.children
                        .filter(obj => obj.userData.type) // 저장할 객체만 필터링
                        .map(obj => ({
                        id: obj.uuid,
                        type: obj.userData.type,
                        position: {
                            x: obj.position.x,
                            y: obj.position.y,
                            z: obj.position.z
                        },
                        rotation: {
                            x: obj.rotation.x,
                            y: obj.rotation.y,
                            z: obj.rotation.z
                        },
                        scale: {
                            x: obj.scale.x,
                            y: obj.scale.y,
                            z: obj.scale.z
                        }
                        }));
                    
                    return JSON.stringify(objects);
            }
             const objects = getAllObjects();
            if (window.flutter_inappwebview) {
                window.flutter_inappwebview.postMessage({
                    type: 'getAllObjects',
                    data: objects
                });
            }
        }
    };

    window.addEventListener('message', handleMessage);
    return () => window.removeEventListener('message', handleMessage);
  }, []);

  const handleSelect = (id: number) => {
    setSelectedId(id === selectedId ? null : id);
  };
  
  const renderObject = (obj: ThreeObject) => {
    let component;
    switch (obj.type) {
      case 'pillar':
        component = <Pillar  position={obj.position} userData={obj} />;
        break;
      case 'house':
        component = <House position={obj.position} userData={obj} />;
        break;
      case 'car':
        component = <Car position={obj.position} userData={obj} />;
        break;
      case 'parking_space':
        component = <ParkingSpace position={obj.position} userData={obj} />;
        break;
      default:
        return null;
    }

    return (
      <SelectableObject
        key={obj.id}
        object={component}
        onClick={() => handleSelect(obj.id)}
        isSelected={selectedId === obj.id}
      />
    );
  };

  return (
    <div 
      style={{ 
        width: '100%', 
        height: '100vh', 
        overflow: 'hidden', // 오버플로우 방지
        touchAction: 'none', // 모든 브라우저 기본 터치 동작 비활성화
        WebkitOverflowScrolling: 'touch', // iOS 스크롤 동작 개선
        position: 'fixed', // 화면 고정
        top: 0,
        left: 0,
      }}
    >
      <Canvas
        camera={{ position: [0, 15, 15], fov: 60 }}
        style={{ height: "100vh" }}
      >
        <ambientLight intensity={0.5} />
        <directionalLight position={[10, 10, 5]} intensity={1} />
        
        <OrbitControls 
          enableDamping // 카메라 움직임에 관성/감쇠 효과를 주는 옵션입니다. 부드러운 카메라 이동을 위해 사용됩니다.
          makeDefault // OrbitControls를 기본 컨트롤러로 설정하는 옵션입니다. 다른 컨트롤러와 충돌을 방지하기 위해 사용됩니다.
        />
        
        <ParkingGround />
        
        {objects.map(renderObject)}
      </Canvas>
    </div>
  );
};

export default ThreeEditor;
