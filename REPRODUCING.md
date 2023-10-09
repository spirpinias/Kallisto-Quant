This [Code Ocean](https://codeocean.com) Compute Capsule will allow you to run and reproduce the results of [Kallisto Quant](https://apps.codeocean.com/capsule/0250260/tree) on your local machine<sup>1</sup>. Follow the instructions below, or consult [our knowledge base](https://help.codeocean.com/user-manual/sharing-and-finding-published-capsules/exporting-capsules-and-reproducing-results-on-your-local-machine) for more information. Don't hesitate to reach out via live chat or [email](mailto:support@codeocean.com) if you have any questions.

<sup>1</sup> You may need access to additional hardware and/or software licenses.

# Prerequisites

- [Docker Community Edition (CE)](https://www.docker.com/community-edition)

# Instructions

## Download attached Data Assets

In order to fetch the Data Asset(s) this Capsule depends on, download them into the Capsule's `data` folder:
* [Kallisto-Hg38-Index](https://apps.codeocean.com/data-assets/6cdccd28-6d95-4108-b353-62d059e03c23) should be downloaded to `data/Index`
* [hg38-Annotation](https://apps.codeocean.com/data-assets/a1195f33-ea55-4c17-bf48-346d9c67dcc3) should be downloaded to `data/Annotation`
* [GEX Fastqs chr11 ](https://apps.codeocean.com/data-assets/0ea0835b-635f-4547-b2a5-aeeea2f9efb6) should be downloaded to `data/Reads`

## Log in to the Docker registry

In your terminal, execute the following command, providing your password or API key when prompted for it:
```shell
docker login -u stephen@codeocean.com registry.apps.codeocean.com
```

## Run the Capsule to reproduce the results

In your terminal, navigate to the folder where you've extracted the Capsule and execute the following command, adjusting parameters as needed:
```shell
docker run --platform linux/amd64 --rm \
  --workdir /code \
  --volume "$PWD/code":/code \
  --volume "$PWD/data":/data \
  --volume "$PWD/results":/results \
  registry.apps.codeocean.com/capsule/f62c5ea4-a9cc-4ec1-963f-9ec500eb8b28 \
  bash run 1 _R1.fastq.gz _R2.fastq.gz 75 8.5 0 False False False False False
```
