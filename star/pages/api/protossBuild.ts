import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../pool'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		const query: string = 'select DISTINCT protossBuild.name, protossBuild.imagePath, protossBuild.mineral, protossBuild.gas, protossBuild.time, protossBuild.health, protossBuild.shield, protossBuild.armor, (protossBuild.desc) as build_desc, protossBuild.groundDamage, protossBuild.groundRange, protossBuild.airDamage, protossBuild.airRange, (a.name) as skill_1, (a.desc) as skill_1_desc from protossBuild LEFT OUTER JOIN skill as a ON protossBuild.skill_1_ID = a.id;'
		const [ rows, fields ] = await db.execute(query)
		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}