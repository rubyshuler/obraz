import React from "react"
import PropTypes from "prop-types"
import $ from 'jquery'

import ShoppingCartPopup from './shopping_cart_popup'

export default class ItemActions extends React.Component {
	constructor(props) {
		super(props)

		this.sizeList = this.sizeList.bind(this)
		this.sizeChange = this.sizeChange.bind(this)
		this.showModal = this.showModal.bind(this)
		this.hideModal = this.hideModal.bind(this)
		this.handleSubmit = this.handleSubmit.bind(this)

		this.state = {
			item: {
				id: this.props.item.id,
				chosen_size: this.props.item.chosen_size,
				name: this.props.item.name,
				price: this.props.item.price,
				first_image: this.props.item.first_image
			},
			sizes: this.props.sizes,
			itemShow: false
		}
	}

	componentDidMount() {
		$.ajaxSetup({
			headers: {
				'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
			}
		})
	}

	handleSubmit(e) {
		$.ajax({
				url: "../items/" + this.props.item.id + "/add_to_order",
				dataType: 'JSON',
				type: 'PATCH',
				method: 'PATCH',
				data: {
					item: {
						chosen_size: this.state.item.chosen_size,
					}
				},
				success: response => {
					this.showModal()
				}
			})
			.done(function (data) {})
	}

	sizeChange(e) {
		let size = e.target.value
		let newState = this.state
		newState.item.chosen_size = size
		this.setState({
			newState
		})
	}

	sizeList() {
		const {
			sizes
		} = this.state;

		const all_sizes = [...sizes];

		return all_sizes.map((size, index) =>
			<option
        key={ index }
        value={ size.id }
      >{ size.size }
      </option>
		);
	}

	showModal = () => {
		this.setState({
			itemShow: true
		});
	};

	hideModal = () => {
		this.setState({
			itemShow: false
		});
	};

	render() {
		const {
			item,
			sizes
		} = this.state

		console.log(item.first_image);

		return (
			<div>
        <select
          className='default_input'
          onChange={this.sizeChange}
          >
          <option value='0' selected>Размер</option>
          { this.sizeList() }
        </select>

        <div><div className='spacing-m-h'></div></div>

				<div className='buttons'>
          <div
            className='l_button primary'
						onClick={ this.handleSubmit }
          >Добавить в корзину</div>
          <div className = 'l_icon_button outline favorite_purple'></div>
        </div>

				<ShoppingCartPopup itemShow={this.state.itemShow} handleClose={this.hideModal} >
					<div className='title'>
						Добавлено!
						<div className='close' onClick={this.hideModal} ></div>
					</div>

					<div className='item_info'>
						<img className='cover' src={item.first_image}></img>
						<div><div className='spacing-m-w'></div></div>
						<div className='info'>
							<h3>{item.name}</h3>
							<h3 className='gray1'>{item.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ' ')}</h3>
							<p>{ item.chosen_size }, Кол-во: 1</p>
						</div>
					</div>

					<div className='l_button primary_black'>Оформить заказ</div>
				</ShoppingCartPopup>
      </div>
		)
	}
}