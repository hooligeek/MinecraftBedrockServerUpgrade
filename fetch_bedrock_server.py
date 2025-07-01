from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import requests

# Set up headless Chrome
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Path to your installed ChromeDriver
service = Service("/usr/local/bin/chromedriver")
driver = webdriver.Chrome(service=service, options=chrome_options)

# Go to the official Bedrock server download page
driver.get("https://www.minecraft.net/en-us/download/server/bedrock")

try:
    # Wait for the download section to appear
    wait = WebDriverWait(driver, 15)
    section = wait.until(
        EC.presence_of_element_located((By.CLASS_NAME, "download-link"))
    )

    # Now try to find the Linux download link
    download_button = driver.find_element(By.XPATH, "//a[contains(@href, 'bin-linux')]")
    download_link = download_button.get_attribute("href")
    print(f"Found download link: {download_link}")

    # Download the server zip file
    response = requests.get(download_link)
    with open("bedrock-server-latest.zip", "wb") as f:
        f.write(response.content)
    print("Download complete: bedrock-server-latest.zip")

except Exception as e:
    print("Failed to find the download link.")
    print("Saving page source for debugging...")
    with open("page_source.html", "w") as f:
        f.write(driver.page_source)
    print(f"Error: {e}")

finally:
    driver.quit()