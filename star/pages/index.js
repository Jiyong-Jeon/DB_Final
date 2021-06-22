export default function rootindex() {
	return (
		<div>
			<Header />
			<Table />
		</div>
	)
}

const Header = () => {
	return <h1>React 데이터베이스 예제 프로그래밍</h1>
}

const Table = () => {
	return (
		<div>
			protoss <br/>
			<a href='https://db-final-nextapi-aikcx.run.goorm.io/protossUnitTable'>protossUnit</a> <br/>
			<a href='https://db-final-nextapi-aikcx.run.goorm.io/protossBuildTable'>protossBuild</a> <br/>
		</div>
	)
}