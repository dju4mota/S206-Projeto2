package projeto.fakeApi;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testPokemon() {
        return Karate.run("users").relativeTo(getClass());
    }    

}
