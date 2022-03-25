# Okode Orbs

A set of orbs for continuous integration for Okode projects.

## Setup

```
$ brew install circleci
$ circleci setup
```
The token can be retrieved from 1Password

## Creating

```sh
$ circleci orb create okode/<orb>
```
Also modify the release.sh script in order to add the publish command corresponding to the new orb.

## Testing

> **IMPORTANT:** Do not commit any of this changes! The proper way to publish on `dev:first` version
> is to have its own branch.

To test the modified orbs you need to publish them directly using the `circleci` command and setting
its version to `dev:first`, e.g.:

```sh
$ circleci orb publish stack/orb.yml okode/stack@dev:first
```

If the orb you are going to test has dependencies over other orbs that you have also modified, then
remember to set their versions to 'dev:first' too before publishing them. That said, if you have
modified the `angular` orb and want to test it using the `stack` orb, then remember to publish the
`angular` orb as `dev:first` but also to publish the `stack` orb as `dev:first` with its dependencies
to the `angular` orb changed to `dev:first` too:

- Publish `angular` orb as `dev:frist`

```sh
$ circleci orb publish angular/orb.yml okode/angular@dev:first
```

- Change `stack` orb dependencies over `angular` orb to `dev:first`
```yml
orbs:
  angular: okode/angular@dev:first
```

- Publish the `stack` orb as `dev:first`

```sh
$ circleci orb publish stack/orb.yml okode/stack@dev:first
```

Remember also to set the `dev:first` orb version at the config.yml template of the proyect that is going to be used to test.

> There is also the [publish-beta.sh](./publish-beta.sh) script to directly publish the orbs as 'dev:first'.

## Publishing

```sh
$ ./release.sh $VERSION
```

## Orbs

### stack

Build and publish fullstack applications based on Ionic and Spring Boot.

### angular

Build and publish Ionic/Angular libraries.
