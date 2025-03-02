import { Canvas } from "@react-three/fiber";
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

// 주차 공간 컴포넌트
const ParkingSpot: React.FC<ParkingSpotProps> = ({ 
  position, 
  isOccupied = false, 
  spotNumber 
}) => {
  const [hovered, setHovered] = useState(false);
  
  return (
    <mesh
      position={position}
      onPointerOver={() => setHovered(true)}
      onPointerOut={() => setHovered(false)}
    >
      <boxGeometry args={[2.5, 0.1, 5]} /> {/* 주차 공간 크기 */}
      <meshStandardMaterial 
        color={isOccupied ? "#ff4444" : (hovered ? "#88ff88" : "#666666")} 
          />
      {/* 주차 공간 번호 */}
      <Html position={[0, 0.1, 0]} center>
        <div style={{ color: 'white', fontSize: '20px' }}>{spotNumber}</div>
        </Html>

    </mesh>
  );
};

// 도로 컴포넌트
const Road: React.FC<RoadProps> = ({ position, size, rotation = [0, 0, 0] }) => {
  return (
    <mesh position={position} rotation={rotation}>
      <boxGeometry args={size} />
      <meshStandardMaterial color="#333333" />
    </mesh>
  );
};

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

const ThreeEditor: React.FC = () => {
  const [objects, setObjects] = useState<ThreeObject[]>([]);
  const [selectedId, setSelectedId] = useState<number | null>(null);

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
        component = <Pillar position={obj.position} />;
        break;
      case 'house':
        component = <House position={obj.position} />;
        break;
      case 'car':
        component = <Car position={obj.position} />;
        break;
      case 'parking_space':
        component = <ParkingSpace position={obj.position} />;
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
