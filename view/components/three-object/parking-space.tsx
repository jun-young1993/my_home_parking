// 주차공간 컴포넌트
const ParkingSpace = ({ position, userData }: { position: [number, number, number], userData: Object }) => {
  return (
    <mesh rotation={[-Math.PI / 2, 0, 0]} position={position} userData={userData}>
      <planeGeometry args={[2.5, 5]} />
      <meshStandardMaterial color="#666666" transparent opacity={0.5} />
    </mesh>
  );
};

export default ParkingSpace;