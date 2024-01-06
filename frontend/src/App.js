import React, { useState, useEffect } from 'react';
import './App.css';

import IngredientInput from './IngredientInput';
import RecipeList from './RecipeList';
import RecipeDetail from './RecipeDetail';

function App() {
    useEffect(() => {
        window.dispatchEvent(new Event('resize'));
    }, []);

  const [recipes, setRecipes] = useState([]);
  const [selectedRecipe, setSelectedRecipe] = useState(null);

  console.log("Selected Recipe:", selectedRecipe);

    const searchRecipes = async (ingredient) => {
        const apiUrl = process.env.REACT_APP_API_URL || ' https://pennylane-assignment-damp-resonance-9200-ancient-dew-7729.fly.dev/api';
        const response = await fetch(`${apiUrl}/recipes/search?ingredients=${ingredient}`);
        const data = await response.json();
        setRecipes(data);
    };

    return (
        <div>
            <h1>Recipe Finder</h1>
            <IngredientInput onSearch={searchRecipes} />
            <div className="content-container">
                <RecipeList recipes={recipes} onSelectRecipe={setSelectedRecipe} />
                <RecipeDetail recipe={selectedRecipe} />
            </div>
        </div>
    );
}

export default App;
