// 집 컴포넌트
const House = ({ position }: { position: [number, number, number] }) => {
  return (
    <group position={position}>
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