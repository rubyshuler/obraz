import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import Profile from '../containers/profile'

document.addEventListener('DOMContentLoaded', () => {
	const profile = JSON.parse(document.getElementsByClassName('profile_pack')[0].dataset.props)

	ReactDOM.render(
		<Profile {...profile}/>,
		document.getElementsByClassName('profile_pack')[0].appendChild(document.createElement('section'))
	)
})