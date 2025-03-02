export { default as Pillar } from './pillar';
export { default as House } from './house';
export { default as Car } from './car';
export { default as ParkingSpace } from './parking-space';
export type { ObjectType } from './interface';




// // 메인 씬 컴포넌트
// const Scene = () => {
//   const [selectedObject, setSelectedObject] = useState<ObjectType | null>(null);

//   useEffect(() => {
//     // Flutter로부터의 메시지 수신
//     const handleMessage = (event: MessageEvent) => {
//       if (event.data.type === 'objectSelection') {
//         console.log('Selected object:', event.data.data.objectType);
//         setSelectedObject(event.data.data.objectType as ObjectType);
//       }
//     };

//     window.addEventListener('message', handleMessage);
//     return () => window.removeEventListener('message', handleMessage);
//   }, []);

//   return (
//     <>
//       <ambientLight intensity={0.5} />
//       <directionalLight position={[10, 10, 10]} intensity={0.8} />
      
//       <Grid
//         args={[20, 20]}
//         cellSize={1}
//         cellThickness={1}
//         cellColor="#6f6f6f"
//         sectionSize={5}
//       />
      
//       <OrbitControls makeDefault />

//       {/* 선택된 오브젝트에 따라 렌더링 */}
//       {selectedObject === 'pillar' && <Pillar />}
//       {selectedObject === 'house' && <House />}
//       {selectedObject === 'car' && <Car />}
//       {selectedObject === 'parking_space' && <ParkingSpace />}
//     </>
//   );
// };

// // 메인 컴포넌트
// const ThreeEditor = () => {
//   return (
//     <div style={{ width: '100%', height: '100vh' }}>
//       <Canvas camera={{ position: [5, 5, 5], fov: 75 }}>
//         <Scene />
//       </Canvas>
//     </div>
//   );
// };

// export default ThreeEditor;