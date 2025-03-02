import { Grid } from "@react-three/drei";

const ParkingGround = () => {
    return (
        <mesh>
            <Grid
                position={[0, -0.01, 0]}
                args={[10, 10]} // 그리드의 크기를 10x10으로 설정
                cellSize={1} // 각 셀의 크기를 1 유닛으로 설정
                cellThickness={1} // 그리드 라인의 두께를 1로 설정
                // cellColor="#6f6f6f" // 그리드 라인의 색상을 회색으로 설정
                sectionSize={1} // 섹션(구획) 크기를 1로 설정
                fadeDistance={30} // 카메라와의 거리가 30 이상일 때 페이드 아웃
                fadeStrength={1} // 페이드 아웃 강도를 1로 설정
                followCamera={false} // 카메라 이동에 따라 그리드가 움직이지 않도록 설정
            />
        </mesh>
    );
};

export default ParkingGround;