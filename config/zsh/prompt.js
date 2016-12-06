'use strict'

const co = require('co')
const execa = require('execa')
const path = require('path')

function * branch() {
	try {
		const { stdout } = yield execa('git', [ 'branch' ])
		const [ branch ] = stdout.trim().split('\n')
			.filter(l => l.startsWith('*'))
		return `(${branch.replace('*', '').trim()}) `
	} catch (e) {
		return ''
	}
}

function dir() {
	const d = process.cwd().replace(process.env.HOME, '~')
	const [ head, tail ] = [ path.dirname(d), path.basename(d) ]

	return path.join(
		head.split(path.sep)
			.map(str => str.replace(/^(\.?.).*/, '$1'))
			.join(path.sep),
		tail
	)
}

co(function * main() {
	console.log(`%B%F{green}${dir()}%f ${yield branch()}%F{cyan}λ%f%b `)
})
