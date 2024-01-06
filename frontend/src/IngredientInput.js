import React, { useState } from 'react';

function IngredientInput({ onSearch }) {
    const [ingredient, setIngredient] = useState('');

    const handleSubmit = (event) => {
        event.preventDefault();
        onSearch(ingredient);
    };

    return (
        <form onSubmit={handleSubmit}>
            <input
                type="text"
                value={ingredient}
                onChange={(e) => setIngredient(e.target.value)}
                placeholder="Enter ingredients"
            />
            <button type="submit">Search Recipes</button>
        </form>
    );
}

export default IngredientInput;
