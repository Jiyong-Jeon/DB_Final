export default function rootindex() {
	return (
		<div className="head">
			<Header />
			<Table />
		</div>
	)
}

const Header = () => {
	return <div><h1>StarCraft</h1>
		<h2>20171017 전지용</h2>
	</div>
}

const Table = () => {
	return (
		<div>
			<div id='menu' className='protossUnitMenu'><a href='https://db-final-nextapi-aikcx.run.goorm.io/protossUnitTable'>ProtossUnit</a></div>
			<div id='menu' className='protossBuildMenu'><a href='https://db-final-nextapi-aikcx.run.goorm.io/protossBuildTable'>ProtossBuild</a></div>
			<br/>
			<br/>
			<br/>
			<br/>
			<div id='menu' className='terranUnitMenu'><a href='https://db-final-nextapi-aikcx.run.goorm.io/terranUnitTable'>TerranUnit</a></div>
			<div id='menu' className='terranBuildMenu'><a href='https://db-final-nextapi-aikcx.run.goorm.io/terranBuildTable'>TerranBuild</a></div>
			<br/>
			<br/>
			<br/>
			<br/>
			<div id='menu' className='zergUnitMenu'><a href='https://db-final-nextapi-aikcx.run.goorm.io/zergUnitTable'>ZergUnit</a></div>
			<div id='menu' className='zergBuildMenu'><a href='https://db-final-nextapi-aikcx.run.goorm.io/zergBuildTable'>ZergBuild</a></div>
		</div>
	)
}