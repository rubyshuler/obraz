// import React from 'react'
// import $ from 'jquery'
//
// import ItemCard from '../components/item_card'
//
// export default class Items extends React.Component {
//   constructor(props) {
//     super(props)
//
//     this.state = {
//       items: props.items
//     }
//   }
//
//   render() {
//     const { items } = this.state
//     let itemElements = []
//
//     items.map((item, i) => {
//       itemElements.push(
//         <ItemCard
//           {...item}
//             index={ i }
//             key={ i }
//           />
//       )
//     })
//
//     return (
//       <div className="item_cards">
//         { itemElements }
//       </div>
//     )
//   }
// }
