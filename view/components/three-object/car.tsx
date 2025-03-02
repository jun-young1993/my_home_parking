// 차량 컴포넌트
const Car = ({ position, userData }: { position: [number, number, number], userData: Object  }) => {
  return (
    <group position={position} userData={userData}>
      {/* 차체 */}
      <mesh position={[0, 0.2, 0]}>
        <boxGeometry args={[2, 0.5, 1]} />
        <meshStandardMaterial color="#4169e1" />
      </mesh>
      {/* 차량 상단부 */}
      <mesh position={[0, 0.6, 0]}>
        <boxGeometry args={[1, 0.4, 0.8]} />
        <meshStandardMaterial color="#4169e1" />
      </mesh>
    </group>
  );
};

export default Car;