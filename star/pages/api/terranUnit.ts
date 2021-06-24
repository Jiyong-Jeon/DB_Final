// 20171017 전지용
import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../pool'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		const query: string = 'select DISTINCT terranUnit.name, terranUnit.imagePath, (terranUnit.char) as `character`, terranUnit.mineral, terranUnit.gas, terranUnit.population, terranUnit.time, terranUnit.health, terranUnit.armor, terranUnit.speed, (terranUnit.desc) as unit_desc, terranUnit.groundDamage, terranUnit.groundRange, terranUnit.airDamage, terranUnit.airRange, (build.name) as build, (a.name) as skill_1, (a.desc) as skill_1_desc, (a.mp) as skill_1_mp, (b.name) as skill_2, (b.desc) as skill_2_desc, (b.mp) as skill_2_mp, (c.name) as skill_3, (c.desc) as skill_3_desc, (c.mp) as skill_3_mp, (d.name) as skill_4, (d.desc) as skill_4_desc, (d.mp) as skill_4_mp from terranUnit LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranUnit, skill WHERE terranUnit.skill_1_ID = skill.id) as a ON terranUnit.skill_1_ID = a.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranUnit, skill WHERE terranUnit.skill_2_ID = skill.id) as b ON terranUnit.skill_2_ID = b.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranUnit, skill WHERE terranUnit.skill_3_ID = skill.id) as c ON terranUnit.skill_3_ID = c.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranUnit, skill WHERE terranUnit.skill_4_ID = skill.id) as d ON terranUnit.skill_4_ID = d.id LEFT OUTER JOIN terranBuild as build ON terranUnit.building_ID = build.id;'
		const [ rows, fields ] = await db.execute(query)
		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}