import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import DesignerProfile from '../containers/designer_profile'

document.addEventListener('DOMContentLoaded', () => {
	const designerProfile = JSON.parse(document.getElementsByClassName('designer_profile_pack')[0].dataset.props)

	ReactDOM.render(
		<DesignerProfile {...designerProfile}/>,
		document.getElementsByClassName('designer_profile_pack')[0].appendChild(document.createElement('section'))
	)
})

import ItemActions from '../components/item_actions'

document.addEventListener('DOMContentLoaded', () => {
	const items = JSON.parse(document.getElementsByClassName('items_action_pack')[0].dataset.props)

	ReactDOM.render(
		<ItemActions {...items}/>,
		document.getElementsByClassName('items_action_pack')[0].appendChild(document.createElement('div'))
	)
})