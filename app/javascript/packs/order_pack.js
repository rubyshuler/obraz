import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import DesignerOrders from '../containers/designer_orders'

document.addEventListener('DOMContentLoaded', () => {
	const designerOrders = JSON.parse(document.getElementsByClassName('designer_orders_pack')[0].dataset.props)

	ReactDOM.render(<DesignerOrders {...designerOrders}/>, document.getElementsByClassName('designer_orders_pack')[0].appendChild(document.createElement('section')))
})

import OrderRefinement from '../containers/order_refinement'

document.addEventListener('DOMContentLoaded', () => {
	const designerOrders = JSON.parse(document.getElementsByClassName('order_refinement_pack')[0].dataset.props)

	ReactDOM.render(<OrderRefinement {...designerOrders}/>, document.getElementsByClassName('order_refinement_pack')[0].appendChild(document.createElement('section')))
})

import OrderForm from '../containers/order_form'

document.addEventListener('DOMContentLoaded', () => {
	const formOrder = JSON.parse(document.getElementsByClassName('order_form_pack')[0].dataset.props)

	ReactDOM.render(<OrderForm {...formOrder}/>, document.getElementsByClassName('order_form_pack')[0].appendChild(document.createElement('div')))
})