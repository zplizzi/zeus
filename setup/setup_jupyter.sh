pip install jupyter
rm -rf ~/.jupyter
mkdir -p ~/.jupyter
cp jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py
echo "Successfully configured jupyter notebook server."
