import React from "react";
import PropTypes from "prop-types";

function ItemsList(props) {
	const {
		items
	} = props;

	const itemsList = items.map((item, index) => (
		<a href={"../../items/" + item.id} key={index} className='item_card'>
      <div className='cover'>
        <div className='l_badge primary_badge sq'></div>
        <img src={item.first_image}></img>
        <div className='l_button primary_black'></div>
      </div>

      <div className='info'>
        <div className='title'>
          <h3>{item.name}</h3>
          <p>{item.brand_name}</p>
        </div>
        <div><div className='spacing-m-w'></div></div>
        <div className='l_badge default_badge'>{item.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ' ')}&#8381;</div>
      </div>
      <div><div className='spacing-xl-h'></div></div>
		</a>
	))

	return (
		<div className='s_item_cards'>
      {itemsList}
    </div>
	);
}

export default ItemsList;