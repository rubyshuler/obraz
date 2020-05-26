import React from "react";
import PropTypes from "prop-types";

function LooksList(props) {
	const {
		looks
	} = props;

	const looksList = looks.map((look, index) => (
		<a href={"../../looks/" + look.id} key={index} className='look_card_sq'>
      <div className='cover'>
        <img src={look.first_image}></img>
      </div>

      <div className='info'>
        <div className='title'>
          <h3>{look.name}</h3>
        </div>
        <div><div className='spacing-m-w'></div></div>
        <div className='l_badge default_badge'>{look.look_price} &#8381;</div>
      </div>
      <div><div className='spacing-xl-h'></div></div>
		</a>
	))

	return (
		<div className='m_look_cards'>
      {looksList}
    </div>
	);
}

export default LooksList;