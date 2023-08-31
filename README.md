Entity Relationship Diagram (ERD)
![image](https://github.com/dipaferdian/officer-web-application/assets/8612273/e6b0118c-5c29-4dbf-8d0b-4d8c417b5069)

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