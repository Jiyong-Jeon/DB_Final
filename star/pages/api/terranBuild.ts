import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../pool'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		const query: string = 'select DISTINCT terranBuild.name, terranBuild.imagePath, terranBuild.mineral, terranBuild.gas, terranBuild.time, terranBuild.health, terranBuild.armor, (terranBuild.desc) as build_desc, terranBuild.groundDamage, terranBuild.groundRange, terranBuild.airDamage, terranBuild.airRange, (a.name) as skill_1, (a.desc) as skill_1_desc, (b.name) as skill_2, (b.desc) as skill_2_desc from terranBuild LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranBuild, skill WHERE terranBuild.skill_1_ID = skill.id) as a ON terranBuild.skill_1_ID = a.id LEFT OUTER JOIN (select skill.id, skill.name, skill.mp, skill.desc from terranBuild, skill WHERE terranBuild.skill_2_ID = skill.id) as b ON terranBuild.skill_2_ID = b.id;'
		const [ rows, fields ] = await db.execute(query)
		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}