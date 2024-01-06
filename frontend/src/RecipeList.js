import React from 'react';

function RecipeList({ recipes, onSelectRecipe }) {
    return (
        <div className="recipe-list">
            {recipes.map((recipe, index) => (
                <div key={index} onClick={() => {
                    console.log("Recipe clicked:", recipe);
                    onSelectRecipe(recipe);
                }}>
                    <h3>{recipe.title}</h3>
                    <p>Cook Time: {recipe.cook_time} minutes</p>
                </div>
            ))}
        </div>
    );
}

export default RecipeList;
