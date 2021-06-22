import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../pool'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		const query: string = 'select DISTINCT protossUnit.name, protossUnit.imagePath, (protossUnit.char) as `character`, protossUnit.mineral, protossUnit.gas, protossUnit.population, protossUnit.time, protossUnit.health, protossUnit.shield, protossUnit.armor, protossUnit.speed, (protossUnit.desc) as unit_desc, protossUnit.groundDamage, protossUnit.groundRange, protossUnit.airDamage, protossUnit.airRange, (build.name) as build, (a.name) as skill_1, (a.desc) as skill_1_desc, (b.name) as skill_2, (b.desc) as skill_2_desc, (c.name) as skill_3, (c.desc) as skill_3_desc, (d.name) as skill_4, (d.desc) as skill_4_desc from protossUnit LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from protossUnit, skill WHERE protossUnit.skill_1_ID = skill.id) as a ON protossUnit.skill_1_ID = a.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from protossUnit, skill WHERE protossUnit.skill_2_ID = skill.id) as b ON protossUnit.skill_2_ID = b.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from protossUnit, skill WHERE protossUnit.skill_3_ID = skill.id) as c ON protossUnit.skill_3_ID = c.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from protossUnit, skill WHERE protossUnit.skill_4_ID = skill.id) as d ON protossUnit.skill_4_ID = d.id LEFT OUTER JOIN protossBuild as build ON protossUnit.building_ID = build.id;'
		const [ rows, fields ] = await db.execute(query)
		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}