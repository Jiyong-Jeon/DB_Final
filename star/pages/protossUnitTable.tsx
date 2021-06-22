import { useState, useEffect } from 'react';
import axios from 'axios';

export default function protossUnitTable() {
	return (
		<div>
			<Header />
			<Table />
		</div>
	)
}

const Header = () => {
	return <h1><a href='https://db-final-nextapi-aikcx.run.goorm.io'>StarCraft Protoss Units</a></h1>
}

const Table = () => {
	const [units, setUnits] = useState([])
	
	const fetchUnit = async () => {
		try {
			const res = await axios.get('https://db-final-nextapi-aikcx.run.goorm.io/api/protossUnit')
			setUnits(res.data)
		} catch (err) {
			console.log(err)
		}
	}
	
	useEffect(() => {
		fetchUnit()
	}, [])
	
	return (
		<table>
			<tr>
				<th>이미지</th>
				<th>이름</th>
				<th>특성</th>
				<th>자원</th>
				<th>체력(실드량)</th>
				<th>방어력</th>
				<th>이동속도</th>
				<th>지상공격</th>
				<th>공중공격</th>
				<th>생산건물</th>
				<th>스킬1</th>
				<th>스킬2</th>
				<th>스킬3</th>
				<th>스킬4</th>
			</tr>
			{units.map((unit, index) => 
				<tr key={index} data-tooltip-text={unit.unit_desc}>
					<td><img src={`https://db-final-nextapi-aikcx.run.goorm.io/${unit.imagePath}`} className='boxart'/></td>
					<td>{unit.name}</td>
					<td>{unit.character}</td>
					<td><p>미네랄: {unit.mineral}, 가스: {unit.gas}</p> <p>인구수: {unit.population}, 시간: {unit.time}</p></td>
					<td>{unit.health}({unit.shield})</td> 
					<td>{unit.armor}</td>
					<td>{unit.speed}</td>
					<td>공격력: {unit.groundDamage==null ? 0 : unit.groundDamage}, 사거리:{unit.groundRange==null ? 0 : unit.groundRange}</td>
					<td>공격력: {unit.airDamage==null ? 0 : unit.airDamage}, 사거리:{unit.airRange==null ? 0 : unit.airRange}</td>
					<td>{unit.build}</td>
					<td skill-tooltip-text={unit.skill_1_desc}>{unit.skill_1==null ? 'X' : unit.skill_1}</td>
					<td skill-tooltip-text={unit.skill_2_desc}>{unit.skill_2==null ? 'X' : unit.skill_2}</td>
					<td skill-tooltip-text={unit.skill_3_desc}>{unit.skill_3==null ? 'X' : unit.skill_3}</td>
					<td skill-tooltip-text={unit.skill_4_desc}>{unit.skill_4==null ? 'X' : unit.skill_4}</td>
				</tr>
			)}
		</table>
	)
}