// 20171017 전지용
import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../pool'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		const query: string = 'select DISTINCT zergUnit.name, zergUnit.imagePath, (zergUnit.char) as `character`, zergUnit.mineral, zergUnit.gas, zergUnit.population, zergUnit.time, zergUnit.health, zergUnit.armor, zergUnit.speed, (zergUnit.desc) as unit_desc, zergUnit.groundDamage, zergUnit.groundRange, zergUnit.airDamage, zergUnit.airRange, (build.name) as build, (a.name) as skill_1, (a.desc) as skill_1_desc, (a.mp) as skill_1_mp, (b.name) as skill_2, (b.desc) as skill_2_desc, (b.mp) as skill_2_mp, (c.name) as skill_3, (c.desc) as skill_3_desc, (c.mp) as skill_3_mp, (d.name) as skill_4, (d.desc) as skill_4_desc, (d.mp) as skill_4_mp from zergUnit LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from zergUnit, skill WHERE zergUnit.skill_1_ID = skill.id) as a ON zergUnit.skill_1_ID = a.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from zergUnit, skill WHERE zergUnit.skill_2_ID = skill.id) as b ON zergUnit.skill_2_ID = b.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from zergUnit, skill WHERE zergUnit.skill_3_ID = skill.id) as c ON zergUnit.skill_3_ID = c.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from zergUnit, skill WHERE zergUnit.skill_4_ID = skill.id) as d ON zergUnit.skill_4_ID = d.id LEFT OUTER JOIN zergBuild as build ON zergUnit.building_ID = build.id;'
		const [ rows, fields ] = await db.execute(query)
		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}