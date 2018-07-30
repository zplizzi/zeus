set -e

pip install jupyter
rm -rf ~/.jupyter
mkdir -p ~/.jupyter
cp ~/zeus/setup/jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py
echo "Successfully configured jupyter notebook server."
