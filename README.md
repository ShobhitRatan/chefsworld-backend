<h1>ChefsWorld</h1>
<a href="https://chefsworld.web.app/">ChefsWorld</a> is a community website for chefs around the world where they can exchange their recipes and ideas. <br />

<h2>Built With</h2>
<ul>
    <li>Backend: Ruby on Rails, Edamam API, Devise package for User Authentication and Admin functionality</li>
    <li>Database: PostgreSQL</li>
    <li>Frontend: ReactJS, React-Bootstrap for styling</li>
    <li>Deployment: Heroku for Backend API deployment <a href="https://chefsworld-backend.herokuapp.com/recipes">Recipe API example</a>, 
    Firebase by Google for <a href="https://chefsworld.web.app/">Frontend</a> Deployment</li>
</ul> 
<h2>Local Installation Steps</h2>
<ol>
    <li>Click on the links for both the <a href="https://github.com/ShobhitRatan/chefsworld-frontend">Frontend</a> 
    and <a href="https://github.com/ShobhitRatan/chefsworld-backend">Backend.</a></li>  
    <li>Clone both repositories into separate folders on your computer.</li>
    <li>In the command line, cd into the backend folder and enter bundle install to install project dependencies.</li>
    <li>Type rails s in the command line to start the backend server and server should be live on localhost:4000.</li>
    <li>Open a new terminal and cd into the frontend folder and run npm install to install project dependencies.</li>
    <li>Run npm start to start your frontend server and ensure the server is running on localhost:3000.</li>
</ol>
<h2>Core Features</h2>
<ul>
    <li>Registration</li>
    <li>Implemented Authentication using JSON Web Token and Local Storage to encrypt user data.</li>
    <li>Ability to enter and update detailed professional experience as chef.</li> 
    <li>Ability to search recipes by type, cuisine, ratings, country and other parameters.</li>
    <li>Ability to add / modify new recipes to site.</li>
    <li>Ability to like recipes</li>
    <li>Ability to comment on recipes</li>
    <li>Ability to have discussion on recipes</li>
</ul>
<h2>Future Goals</h2>
<ul>
    <li>Set up a payment gateway such as Stripe to handle payments.</li>
    <li>Ability to reply on previous comments (polymorphic relationship)</li>
    <li>Add an admin / superuser account to the website who can approve / deny chefs who don't maintain decorum on forums.</li>
    <li>Implement following functionality so that chefs can follow other chefs.</li>
    <li>Use Google Maps API  so that chefs can deliver recipes to other users based on geographic location.</li>
</ul>
