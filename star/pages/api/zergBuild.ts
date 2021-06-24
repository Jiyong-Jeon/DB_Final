// 20171017 전지용
import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../pool'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		const query: string = 'select DISTINCT zergBuild.name, zergBuild.imagePath, zergBuild.mineral, zergBuild.gas, zergBuild.time, zergBuild.health, zergBuild.armor, (zergBuild.desc) as build_desc, zergBuild.groundDamage, zergBuild.groundRange, zergBuild.airDamage, zergBuild.airRange, (a.name) as skill_1, (a.desc) as skill_1_desc, (a.mp) as skill_1_mp from zergBuild LEFT OUTER JOIN skill as a ON zergBuild.skill_1_ID = a.id;'
		const [ rows, fields ] = await db.execute(query)
		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}