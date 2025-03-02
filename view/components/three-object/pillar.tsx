const Pillar = ({ position, userData }: { position: [number, number, number], userData: Object }) => {
  return (
    <mesh position={position} userData={userData}>
      <cylinderGeometry args={[0.3, 0.3, 2]} />
      <meshStandardMaterial color="#888888" />
    </mesh>
  );
};

export default Pillar;