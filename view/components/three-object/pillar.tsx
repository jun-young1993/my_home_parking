const Pillar = ({ position }: { position: [number, number, number] }) => {
  return (
    <mesh position={position}>
      <cylinderGeometry args={[0.3, 0.3, 2]} />
      <meshStandardMaterial color="#888888" />
    </mesh>
  );
};

export default Pillar;