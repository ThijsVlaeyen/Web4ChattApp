package domain;

import java.util.List;

import db.IPersonRepository;
import db.PersonRepository;

public class PersonService {
	private IPersonRepository IPersonRepository = new PersonRepository();

	public PersonService(){
	}

	public Person getPersonByName(String name) {
		return getIPersonRepository().getByName(name);
	}
	
	public Person getPerson(String personId)  {
		return getIPersonRepository().get(personId);
	}

	public List<Person> getPersons() {
		return getIPersonRepository().getAll();
	}

	public void addPerson(Person person) {
		getIPersonRepository().add(person);
	}

	public void updatePersons(Person person) {
		getIPersonRepository().update(person);
	}

	public void deletePerson(String id) {
		getIPersonRepository().delete(id);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		return getIPersonRepository().getAuthenticatedUser(email, password);
	}

	private IPersonRepository getIPersonRepository() {
		return IPersonRepository;
	}
}
