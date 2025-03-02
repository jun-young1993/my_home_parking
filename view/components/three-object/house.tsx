// 집 컴포넌트
const House = ({ position, userData }: { position: [number, number, number], userData: Object  }) => {
  return (
    <group position={position} userData={userData}>
      {/* 집 몸체 */}
      <mesh position={[0, 0.5, 0]}>
        <boxGeometry args={[2, 1, 2]} />
        <meshStandardMaterial color="#cd8500" />
      </mesh>
      {/* 지붕 */}
      <mesh position={[0, 1.5, 0]} rotation={[0, Math.PI / 4, 0]}>
        <coneGeometry args={[1.5, 1, 4]} />
        <meshStandardMaterial color="#8b4513" />
      </mesh>
    </group>
  );
};

export default House;