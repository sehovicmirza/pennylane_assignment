// src/RecipeDetail.js

import React from 'react';

function RecipeDetail({ recipe }) {
    // Log at the beginning of the function to see if it's being called
    console.log("Rendering RecipeDetail component");

    // Log the recipe prop to see what it contains
    console.log("Recipe received:", recipe);

    if (!recipe) {
        return <div>Select a recipe to see the details</div>;
    }

    console.log("Recipe Data:", recipe);


    // Returning the JSX
    return (
        <div className="recipe-detail">
            <h2>{recipe.title}</h2>
            <p>Cook Time: {recipe.cook_time} minutes</p>
            <p>Prep Time: {recipe.prep_time}</p>
            <p>Ratings: {recipe.ratings}</p>
            <p>Ingredients:</p>
            <ul>
                {recipe.ingredients.map((ingredient, index) => (
                    <li key={index}>{ingredient.name}</li>
                ))}
            </ul>
        </div>
    );
}

export default RecipeDetail;
