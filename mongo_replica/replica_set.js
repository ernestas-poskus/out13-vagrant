config = {
	_id: 'rsmain', members: 
	[
		{_id: 0, host: '127.0.0.1:27117'},
		{_id: 1, host: '127.0.0.1:27217'},
		{_id: 2, host: '127.0.0.1:27317'}
	]
}

rs.reconfig(config, {force: true})