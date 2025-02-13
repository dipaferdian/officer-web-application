# Product Requirement Document (PRD)
[Product Document](https://dipaferdian.atlassian.net/wiki/external/ODlkYzg2NjAyYmJjNGYxM2JhZTU0MDJhYWI5MmRlOWE)

# Branching
 ![branch-police](https://github.com/user-attachments/assets/af247712-5ca7-4f4a-8134-5d30bf104442)

# Entity Relationship Diagram (ERD)
![police](https://github.com/user-attachments/assets/ac29695c-d67d-4aa6-8853-187ae7817c7c) 



# Requirements
- Ruby 3.2.4

# How to setup database
1. rails db:create

# How to run this application
1. Clone this repository
2. Run `bundle`

### Run rails console
```
bundle exec rails c
```
### Run debug mode
```
bundle exec rdbg --open -n -c -- bundle exec rails s
```

# How to run test
1. Run `rspec`

# Web Feature
- ### Officer
  * Detail officer
  * Edit officer
  * Delete officer

# Graphql
- ## Officer
  * Create Officer
```graphql
mutation {
  createOfficer(input: {
    name: String,
    rankId: Integer
  }){
    officer{
      id,
      name,
      created_at,
      updated_at
      rank{
        id,
        name,
        created_at,
        updated_at
      }
    },
    errors
  }
}
```

  * Get Officer
```graphql
{
  officers(page: Integer) {
    id,
    name,
    created_at,
    updated_at
    rank {
      id,
      name,
      created_at,
      updated_at
    }
  }
}
```
