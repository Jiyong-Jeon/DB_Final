// 20171017 전지용
import { useState, useEffect } from 'react';
import axios from 'axios';

export default function terranBuildTable() {
	return (
		<div>
			<Header />
			<Table />
		</div>
	)
}

const Header = () => {
	return <div><h1><a href='https://db-final-nextapi-aikcx.run.goorm.io'>StarCraft Terran Buildings</a></h1>
	<h2>20171017 전지용</h2></div>
}

const Table = () => {
	const [units, setUnits] = useState([])
	
	const fetchUnit = async () => {
		try {
			const res = await axios.get('https://db-final-nextapi-aikcx.run.goorm.io/api/terranBuild')
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
			<tr className='terranBuildMenu'>
				<th>이미지</th>
				<th>이름</th>
				<th>자원</th>
				<th>체력</th>
				<th>방어력</th>
				<th>지상공격</th>
				<th>공중공격</th>
				<th>스킬1</th>
				<th>스킬2</th>
			</tr>
			{units.map((unit, index) => 
				<tr key={index} data-tooltip-text={unit.build_desc}>
					<td><img src={`https://db-final-nextapi-aikcx.run.goorm.io/${unit.imagePath}`} className='boxart'/></td>
					<td>{unit.name}</td>
						   <td>
							   <p>미네랄: {unit.mineral}</p> 
							   <p>가스: {unit.gas}</p> 
							   <p>인구수: {unit.population}</p>
							   <p>시간: {unit.time}</p>
						   </td>
					<td>{unit.health}</td> 
					<td>{unit.armor}</td>
					<td>
						<p>공격력: {unit.groundDamage==null ? 0 : unit.groundDamage}</p>
						<p>사거리: {unit.groundRange==null ? 0 : unit.groundRange}</p>
					</td>
					<td>
						<p>공격력: {unit.airDamage==null ? 0 : unit.airDamage}</p>
						<p>사거리: {unit.airRange==null ? 0 : unit.airRange}</p>
					</td>
					<td skill-tooltip-text={unit.skill_1_desc}>{unit.skill_1==null ? 'X' : unit.skill_1}</td>
					<td skill-tooltip-text={unit.skill_2_desc}>{unit.skill_2==null ? 'X' : unit.skill_2}</td>
				</tr>
			)}
		</table>
	)
}