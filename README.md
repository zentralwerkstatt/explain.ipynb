# Images of Image Machines. Visual Interpretability in Digital Art History

This repository contains all the code necessary to reproduce the results in the paper "Images of Image Machines. Visual Interpretability in Computer Vision for Art" by Fabian Offert, to be published in the Proceedings of the 2018 European Conference on Computer Vision. It also provides extended commentary on the details of the technical implementation, and options for easy replication and scalability (REST API, HTML interface).

![](0.jpg)

## Installation

This repository officially only supports Unix-based operating systems but most likely runs on Windows as well, given a proper Python environment (untested).

### Manual installation using pip or conda

We suggest running the notebooks within an [Anaconda](https://www.anaconda.com/download) or [Miniconda](https://conda.io/miniconda.html) envrionment. The notebooks in the repository have only Python dependencies, all of which can be installed with `pip` or `conda`, with the exception of TensorFlow, which should be installed according to https://www.tensorflow.org/install/. To install all dependencies with conda in a Miniconda environment, run

`conda install pip bcolz gevent h5py mkl notebook Pillow pygpu pyyaml scikit-learn six cython
pip install tensorflow-gpu keras jupyter_kernel_gateway`

Replace `tensorflow-gpu` with `tensorflow` for a CPU only installation. Then clone the repository and run jupyter in the repository directory (`jupyter notebook`).

### Installation using Docker

Simply clone the repository and run the included `Dockerfile_GPU` or `Dockerfile_CPU` for an environment with or without NVIDIA GPU support.

## Features

- A downloader for the Web Gallery of Art dataset
- A simple way of fine-tuning the InceptionV3 network on the WGA datset
- A fast (threaded) way of generating feature visualization images for multiple architectures and pre-trained Keras Models with minimal regularization
- A REST API for feature visualization generation
- A simple HTML interface that uses this API

## Interface

The repository comes with an example [HTML interface](index.html). When the [backend.ipynb](backend.ipynb) notebook is running in API mode (see notebook for details), the interface can be used to explore the feature visualization space for a model, by generating feature visualization images for different layers, neurons, and in different resolutions. The visualization thread gives priority to high-resolution images, so if an interesting neuron is found, high resolution feature visualizations can be generated immediately. Interesting images can simply be saved by right clicking.

![](interface.gif)