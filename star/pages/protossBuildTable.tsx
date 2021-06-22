import { useState, useEffect } from 'react';
import axios from 'axios';

export default function protossBuildTable() {
	return (
		<div>
			<Header />
			<Table />
		</div>
	)
}

const Header = () => {
	return <h1><a href='https://db-final-nextapi-aikcx.run.goorm.io'>StarCraft Protoss Buildings</a></h1>
}

const Table = () => {
	const [units, setUnits] = useState([])
	
	const fetchUnit = async () => {
		try {
			const res = await axios.get('https://db-final-nextapi-aikcx.run.goorm.io/api/protossBuild')
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
				<th>자원</th>
				<th>체력(실드량)</th>
				<th>방어력</th>
				<th>지상공격</th>
				<th>공중공격</th>
				<th>스킬1</th>
			</tr>
			{units.map((unit, index) => 
				<tr key={index} data-tooltip-text={unit.build_desc}>
					<td><img src={`https://db-final-nextapi-aikcx.run.goorm.io/${unit.imagePath}`} className='boxart'/></td>
					<td>{unit.name}</td>
					<td><p>미네랄: {unit.mineral}, 가스: {unit.gas}</p> <p>인구수: {unit.population}, 시간: {unit.time}</p></td>
					<td>{unit.health}({unit.shield})</td> 
					<td>{unit.armor}</td>
					<td>공격력: {unit.groundDamage==null ? 0 : unit.groundDamage}, 사거리:{unit.groundRange==null ? 0 : unit.groundRange}</td>
					<td>공격력: {unit.airDamage==null ? 0 : unit.airDamage}, 사거리:{unit.airRange==null ? 0 : unit.airRange}</td>
					<td skill-tooltip-text={unit.skill_1_desc}>{unit.skill_1==null ? 'X' : unit.skill_1}</td>
				</tr>
			)}
		</table>
	)
}