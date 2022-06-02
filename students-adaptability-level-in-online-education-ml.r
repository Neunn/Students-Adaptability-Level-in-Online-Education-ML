{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "42974f5a",
   "metadata": {
    "papermill": {
     "duration": 0.007461,
     "end_time": "2022-06-02T15:20:29.407006",
     "exception": false,
     "start_time": "2022-06-02T15:20:29.399545",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Import Library"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "d170e7f0",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:29.424014Z",
     "iopub.status.busy": "2022-06-02T15:20:29.421625Z",
     "iopub.status.idle": "2022-06-02T15:20:33.127888Z",
     "shell.execute_reply": "2022-06-02T15:20:33.126154Z"
    },
    "papermill": {
     "duration": 3.717202,
     "end_time": "2022-06-02T15:20:33.130388",
     "exception": false,
     "start_time": "2022-06-02T15:20:29.413186",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘dplyr’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n",
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.6     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘plotly’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:ggplot2’:\n",
      "\n",
      "    last_plot\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    filter\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:graphics’:\n",
      "\n",
      "    layout\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    config\n",
      "\n",
      "\n",
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    lift\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(dplyr)\n",
    "library(tidyverse)\n",
    "library(plotly)\n",
    "library(fastDummies)\n",
    "library(caret)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "065c390f",
   "metadata": {
    "papermill": {
     "duration": 0.006738,
     "end_time": "2022-06-02T15:20:33.144459",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.137721",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Import Dataset"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "626b148c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:33.192455Z",
     "iopub.status.busy": "2022-06-02T15:20:33.160526Z",
     "iopub.status.idle": "2022-06-02T15:20:33.455385Z",
     "shell.execute_reply": "2022-06-02T15:20:33.452712Z"
    },
    "papermill": {
     "duration": 0.30578,
     "end_time": "2022-06-02T15:20:33.458164",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.152384",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m1205\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m14\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (14): Gender, Age, Education Level, Institution Type, IT Student, Locati...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "df <- read_csv(\"../input/students-adaptability-level-in-online-education/students_adaptability_level_online_education.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "b0334035",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:33.475689Z",
     "iopub.status.busy": "2022-06-02T15:20:33.474232Z",
     "iopub.status.idle": "2022-06-02T15:20:33.505121Z",
     "shell.execute_reply": "2022-06-02T15:20:33.503397Z"
    },
    "papermill": {
     "duration": 0.041376,
     "end_time": "2022-06-02T15:20:33.507123",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.465747",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Gender</th><th scope=col>Age</th><th scope=col>Education Level</th><th scope=col>Institution Type</th><th scope=col>IT Student</th><th scope=col>Location</th><th scope=col>Load-shedding</th><th scope=col>Financial Condition</th><th scope=col>Internet Type</th><th scope=col>Network Type</th><th scope=col>Class Duration</th><th scope=col>Self Lms</th><th scope=col>Device</th><th scope=col>Adaptivity Level</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Boy </td><td>21-25</td><td>University</td><td>Non Government</td><td>No</td><td>Yes</td><td>Low </td><td>Mid </td><td>Wifi       </td><td>4G</td><td>3-6</td><td>No </td><td>Tab   </td><td>Moderate</td></tr>\n",
       "\t<tr><td>Girl</td><td>21-25</td><td>University</td><td>Non Government</td><td>No</td><td>Yes</td><td>High</td><td>Mid </td><td>Mobile Data</td><td>4G</td><td>1-3</td><td>Yes</td><td>Mobile</td><td>Moderate</td></tr>\n",
       "\t<tr><td>Girl</td><td>16-20</td><td>College   </td><td>Government    </td><td>No</td><td>Yes</td><td>Low </td><td>Mid </td><td>Wifi       </td><td>4G</td><td>1-3</td><td>No </td><td>Mobile</td><td>Moderate</td></tr>\n",
       "\t<tr><td>Girl</td><td>11-15</td><td>School    </td><td>Non Government</td><td>No</td><td>Yes</td><td>Low </td><td>Mid </td><td>Mobile Data</td><td>4G</td><td>1-3</td><td>No </td><td>Mobile</td><td>Moderate</td></tr>\n",
       "\t<tr><td>Girl</td><td>16-20</td><td>School    </td><td>Non Government</td><td>No</td><td>Yes</td><td>Low </td><td>Poor</td><td>Mobile Data</td><td>3G</td><td>0  </td><td>No </td><td>Mobile</td><td>Low     </td></tr>\n",
       "\t<tr><td>Boy </td><td>11-15</td><td>School    </td><td>Non Government</td><td>No</td><td>Yes</td><td>Low </td><td>Poor</td><td>Mobile Data</td><td>3G</td><td>1-3</td><td>No </td><td>Mobile</td><td>Low     </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 14\n",
       "\\begin{tabular}{llllllllllllll}\n",
       " Gender & Age & Education Level & Institution Type & IT Student & Location & Load-shedding & Financial Condition & Internet Type & Network Type & Class Duration & Self Lms & Device & Adaptivity Level\\\\\n",
       " <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t Boy  & 21-25 & University & Non Government & No & Yes & Low  & Mid  & Wifi        & 4G & 3-6 & No  & Tab    & Moderate\\\\\n",
       "\t Girl & 21-25 & University & Non Government & No & Yes & High & Mid  & Mobile Data & 4G & 1-3 & Yes & Mobile & Moderate\\\\\n",
       "\t Girl & 16-20 & College    & Government     & No & Yes & Low  & Mid  & Wifi        & 4G & 1-3 & No  & Mobile & Moderate\\\\\n",
       "\t Girl & 11-15 & School     & Non Government & No & Yes & Low  & Mid  & Mobile Data & 4G & 1-3 & No  & Mobile & Moderate\\\\\n",
       "\t Girl & 16-20 & School     & Non Government & No & Yes & Low  & Poor & Mobile Data & 3G & 0   & No  & Mobile & Low     \\\\\n",
       "\t Boy  & 11-15 & School     & Non Government & No & Yes & Low  & Poor & Mobile Data & 3G & 1-3 & No  & Mobile & Low     \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 14\n",
       "\n",
       "| Gender &lt;chr&gt; | Age &lt;chr&gt; | Education Level &lt;chr&gt; | Institution Type &lt;chr&gt; | IT Student &lt;chr&gt; | Location &lt;chr&gt; | Load-shedding &lt;chr&gt; | Financial Condition &lt;chr&gt; | Internet Type &lt;chr&gt; | Network Type &lt;chr&gt; | Class Duration &lt;chr&gt; | Self Lms &lt;chr&gt; | Device &lt;chr&gt; | Adaptivity Level &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| Boy  | 21-25 | University | Non Government | No | Yes | Low  | Mid  | Wifi        | 4G | 3-6 | No  | Tab    | Moderate |\n",
       "| Girl | 21-25 | University | Non Government | No | Yes | High | Mid  | Mobile Data | 4G | 1-3 | Yes | Mobile | Moderate |\n",
       "| Girl | 16-20 | College    | Government     | No | Yes | Low  | Mid  | Wifi        | 4G | 1-3 | No  | Mobile | Moderate |\n",
       "| Girl | 11-15 | School     | Non Government | No | Yes | Low  | Mid  | Mobile Data | 4G | 1-3 | No  | Mobile | Moderate |\n",
       "| Girl | 16-20 | School     | Non Government | No | Yes | Low  | Poor | Mobile Data | 3G | 0   | No  | Mobile | Low      |\n",
       "| Boy  | 11-15 | School     | Non Government | No | Yes | Low  | Poor | Mobile Data | 3G | 1-3 | No  | Mobile | Low      |\n",
       "\n"
      ],
      "text/plain": [
       "  Gender Age   Education Level Institution Type IT Student Location\n",
       "1 Boy    21-25 University      Non Government   No         Yes     \n",
       "2 Girl   21-25 University      Non Government   No         Yes     \n",
       "3 Girl   16-20 College         Government       No         Yes     \n",
       "4 Girl   11-15 School          Non Government   No         Yes     \n",
       "5 Girl   16-20 School          Non Government   No         Yes     \n",
       "6 Boy    11-15 School          Non Government   No         Yes     \n",
       "  Load-shedding Financial Condition Internet Type Network Type Class Duration\n",
       "1 Low           Mid                 Wifi          4G           3-6           \n",
       "2 High          Mid                 Mobile Data   4G           1-3           \n",
       "3 Low           Mid                 Wifi          4G           1-3           \n",
       "4 Low           Mid                 Mobile Data   4G           1-3           \n",
       "5 Low           Poor                Mobile Data   3G           0             \n",
       "6 Low           Poor                Mobile Data   3G           1-3           \n",
       "  Self Lms Device Adaptivity Level\n",
       "1 No       Tab    Moderate        \n",
       "2 Yes      Mobile Moderate        \n",
       "3 No       Mobile Moderate        \n",
       "4 No       Mobile Moderate        \n",
       "5 No       Mobile Low             \n",
       "6 No       Mobile Low             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7b1ed6a2",
   "metadata": {
    "papermill": {
     "duration": 0.00696,
     "end_time": "2022-06-02T15:20:33.521233",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.514273",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# ทำให้ชื่อแต่ละ column เลือกง่ายขึ้น"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "9e579ed0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:33.538036Z",
     "iopub.status.busy": "2022-06-02T15:20:33.536679Z",
     "iopub.status.idle": "2022-06-02T15:20:33.549718Z",
     "shell.execute_reply": "2022-06-02T15:20:33.548110Z"
    },
    "papermill": {
     "duration": 0.023363,
     "end_time": "2022-06-02T15:20:33.551706",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.528343",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "names(df) <- gsub(\" \", \"_\", names(df))    "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "d7b0977a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:33.569346Z",
     "iopub.status.busy": "2022-06-02T15:20:33.567652Z",
     "iopub.status.idle": "2022-06-02T15:20:33.582276Z",
     "shell.execute_reply": "2022-06-02T15:20:33.580288Z"
    },
    "papermill": {
     "duration": 0.025993,
     "end_time": "2022-06-02T15:20:33.584686",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.558693",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "names(df) <- gsub(\"-\", \"_\", names(df))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bbea3fcc",
   "metadata": {
    "papermill": {
     "duration": 0.008058,
     "end_time": "2022-06-02T15:20:33.600740",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.592682",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Check ค่า NA"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "264ef3a1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:33.620690Z",
     "iopub.status.busy": "2022-06-02T15:20:33.618773Z",
     "iopub.status.idle": "2022-06-02T15:20:33.640041Z",
     "shell.execute_reply": "2022-06-02T15:20:33.638222Z"
    },
    "papermill": {
     "duration": 0.033457,
     "end_time": "2022-06-02T15:20:33.642261",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.608804",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>Gender</dt><dd>0</dd><dt>Age</dt><dd>0</dd><dt>Education_Level</dt><dd>0</dd><dt>Institution_Type</dt><dd>0</dd><dt>IT_Student</dt><dd>0</dd><dt>Location</dt><dd>0</dd><dt>Load_shedding</dt><dd>0</dd><dt>Financial_Condition</dt><dd>0</dd><dt>Internet_Type</dt><dd>0</dd><dt>Network_Type</dt><dd>0</dd><dt>Class_Duration</dt><dd>0</dd><dt>Self_Lms</dt><dd>0</dd><dt>Device</dt><dd>0</dd><dt>Adaptivity_Level</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[Gender] 0\n",
       "\\item[Age] 0\n",
       "\\item[Education\\textbackslash{}\\_Level] 0\n",
       "\\item[Institution\\textbackslash{}\\_Type] 0\n",
       "\\item[IT\\textbackslash{}\\_Student] 0\n",
       "\\item[Location] 0\n",
       "\\item[Load\\textbackslash{}\\_shedding] 0\n",
       "\\item[Financial\\textbackslash{}\\_Condition] 0\n",
       "\\item[Internet\\textbackslash{}\\_Type] 0\n",
       "\\item[Network\\textbackslash{}\\_Type] 0\n",
       "\\item[Class\\textbackslash{}\\_Duration] 0\n",
       "\\item[Self\\textbackslash{}\\_Lms] 0\n",
       "\\item[Device] 0\n",
       "\\item[Adaptivity\\textbackslash{}\\_Level] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "Gender\n",
       ":   0Age\n",
       ":   0Education_Level\n",
       ":   0Institution_Type\n",
       ":   0IT_Student\n",
       ":   0Location\n",
       ":   0Load_shedding\n",
       ":   0Financial_Condition\n",
       ":   0Internet_Type\n",
       ":   0Network_Type\n",
       ":   0Class_Duration\n",
       ":   0Self_Lms\n",
       ":   0Device\n",
       ":   0Adaptivity_Level\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "             Gender                 Age     Education_Level    Institution_Type \n",
       "                  0                   0                   0                   0 \n",
       "         IT_Student            Location       Load_shedding Financial_Condition \n",
       "                  0                   0                   0                   0 \n",
       "      Internet_Type        Network_Type      Class_Duration            Self_Lms \n",
       "                  0                   0                   0                   0 \n",
       "             Device    Adaptivity_Level \n",
       "                  0                   0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df %>%\n",
    "    sapply(function(.){\n",
    "        sum(is.na(.))\n",
    "    })"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "17aeab62",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:33.660653Z",
     "iopub.status.busy": "2022-06-02T15:20:33.659133Z",
     "iopub.status.idle": "2022-06-02T15:20:33.752440Z",
     "shell.execute_reply": "2022-06-02T15:20:33.750311Z"
    },
    "papermill": {
     "duration": 0.104814,
     "end_time": "2022-06-02T15:20:33.754919",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.650105",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df_boy_girl <- df %>%\n",
    "    count(Gender) %>%\n",
    "    rename(Count = n)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "48829fff",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:33.773515Z",
     "iopub.status.busy": "2022-06-02T15:20:33.771938Z",
     "iopub.status.idle": "2022-06-02T15:20:34.190277Z",
     "shell.execute_reply": "2022-06-02T15:20:34.188375Z"
    },
    "papermill": {
     "duration": 0.429884,
     "end_time": "2022-06-02T15:20:34.192471",
     "exception": false,
     "start_time": "2022-06-02T15:20:33.762587",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nVJbXbZOvfefIASmlXH3dB68+c/X1V39nTvervjMy33MB+ZGrm3/NWafc/VLR7vvvM+rIz2dr\nKl775+O3Xfujh5896qqzDmpIu7322mtIR/+kkn/+FsLyirtsOHTo0I9vbDb8c6/+beKjN6Uk\n7GAd9cw1Z939n7JJV100vHuHhpWtRm6/y7Z9jz7z11e+sOsJQ8pTSieccMJy31VXtShb0qmt\nZ2Wd5zV2sAIFBSlb3Lvh67qqt3518cRjRh+y/8GHnXrmTx5+tSKl9O+rTz7k6CuW7j//5Sv2\nG3XoW9V1+RkXWKNydXMvunf2Jt84c2nVNeg29NBzJvzfyOJsw82D9ttvynuLU0qj99/vrg8+\nnPKTCcd87ZI8jMs6zxU7WF51xevPP1+YUkr1dR+89sxVD32427cmpZRSyl35re/MrB447tQJ\nfTrVPHbHtReffup6N/xy4EFfqbrrymcWfm1EWVFK6Zlr/lY+6Lg+n5zugbXakjl/qKir33eb\nz/33ps23afxC/l9+/oPhXz76R0cPbOXRoBHCDpY395+/POOMT2+W9ho5/H86pZQWv3fTfW8u\nHH/dhJ26d0gpbbTJpv8cfeTVv3v90iP32rLs2pseenfE3v3qa+dc88K8kT/ZJl/DA2tWXdVb\nKaWey/xX7ZwjDnqyorrh69L1j5p2zcHLfcv8DY4/bNfN2mxCWJawg+VtsO15V585rOHrqoo5\nD04770ffOvknv7m6y/P/yJb03fmTp2MyBR1H9Sq9/NE30pEDD9+111m33pf2/tpHs365qLD3\ncYO65G98YE3KlvRNKT2/uKZ/ycdtd/T3zzmgtj6l9NYff37dvxr5ll679GvDAeEzvMYOmlPS\nufsex34/1X409cV5uVxK6TMfelJQkEm5+pRSv1H7Vs6587nFNTOvfW6Dkd/oUOCzUSCIjt33\n6ZzN3PfHt5eu9B+yydChQ4cOHdrh3cpGv6W0s4sm5I2wgxWor5lTn8sVF2fLN9m0rmr2jE8+\n5S5XX3nHW4u6b9M/pdSh225blxVdf/+jN765cO8xX8jrvMCalMl2PW2nPq/dfP6TH3wm4xa+\n/sDl/56Xr6mgKf5XAcv79M0TKVUvnPPQrb/MlvQ9dlCX0uLRu/X5w5Vn/CT7jYP6dKr9y22/\nfKGm67mH9G/Y89A9+px23aXFnUd+tUfH/M0OrHkjvnnel1856bwTvrnrfnttOnDDrtnFr774\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = df_boy_girl, mapping = aes(x = Gender, y = Count)) + geom_col(width = 0.3) + scale_fill_manual(c(\"red\", \"yellow\")) + theme_minimal()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "9ec52de1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:34.212455Z",
     "iopub.status.busy": "2022-06-02T15:20:34.210851Z",
     "iopub.status.idle": "2022-06-02T15:20:34.255376Z",
     "shell.execute_reply": "2022-06-02T15:20:34.253586Z"
    },
    "papermill": {
     "duration": 0.056494,
     "end_time": "2022-06-02T15:20:34.257387",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.200893",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 18 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Gender</th><th scope=col>Age</th><th scope=col>Education_Level</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Boy </td><td>1-5  </td><td>School    </td><td> 14</td></tr>\n",
       "\t<tr><td>Boy </td><td>11-15</td><td>School    </td><td>211</td></tr>\n",
       "\t<tr><td>Boy </td><td>16-20</td><td>College   </td><td> 76</td></tr>\n",
       "\t<tr><td>Boy </td><td>16-20</td><td>School    </td><td> 24</td></tr>\n",
       "\t<tr><td>Boy </td><td>16-20</td><td>University</td><td>  9</td></tr>\n",
       "\t<tr><td>Boy </td><td>21-25</td><td>College   </td><td> 12</td></tr>\n",
       "\t<tr><td>Boy </td><td>21-25</td><td>University</td><td>253</td></tr>\n",
       "\t<tr><td>Boy </td><td>26-30</td><td>University</td><td> 42</td></tr>\n",
       "\t<tr><td>Boy </td><td>6-10 </td><td>School    </td><td> 22</td></tr>\n",
       "\t<tr><td>Girl</td><td>1-5  </td><td>School    </td><td> 67</td></tr>\n",
       "\t<tr><td>Girl</td><td>11-15</td><td>School    </td><td>142</td></tr>\n",
       "\t<tr><td>Girl</td><td>16-20</td><td>College   </td><td>121</td></tr>\n",
       "\t<tr><td>Girl</td><td>16-20</td><td>School    </td><td> 21</td></tr>\n",
       "\t<tr><td>Girl</td><td>16-20</td><td>University</td><td> 27</td></tr>\n",
       "\t<tr><td>Girl</td><td>21-25</td><td>College   </td><td> 10</td></tr>\n",
       "\t<tr><td>Girl</td><td>21-25</td><td>University</td><td> 99</td></tr>\n",
       "\t<tr><td>Girl</td><td>26-30</td><td>University</td><td> 26</td></tr>\n",
       "\t<tr><td>Girl</td><td>6-10 </td><td>School    </td><td> 29</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 18 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Gender & Age & Education\\_Level & n\\\\\n",
       " <chr> & <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Boy  & 1-5   & School     &  14\\\\\n",
       "\t Boy  & 11-15 & School     & 211\\\\\n",
       "\t Boy  & 16-20 & College    &  76\\\\\n",
       "\t Boy  & 16-20 & School     &  24\\\\\n",
       "\t Boy  & 16-20 & University &   9\\\\\n",
       "\t Boy  & 21-25 & College    &  12\\\\\n",
       "\t Boy  & 21-25 & University & 253\\\\\n",
       "\t Boy  & 26-30 & University &  42\\\\\n",
       "\t Boy  & 6-10  & School     &  22\\\\\n",
       "\t Girl & 1-5   & School     &  67\\\\\n",
       "\t Girl & 11-15 & School     & 142\\\\\n",
       "\t Girl & 16-20 & College    & 121\\\\\n",
       "\t Girl & 16-20 & School     &  21\\\\\n",
       "\t Girl & 16-20 & University &  27\\\\\n",
       "\t Girl & 21-25 & College    &  10\\\\\n",
       "\t Girl & 21-25 & University &  99\\\\\n",
       "\t Girl & 26-30 & University &  26\\\\\n",
       "\t Girl & 6-10  & School     &  29\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 18 × 4\n",
       "\n",
       "| Gender &lt;chr&gt; | Age &lt;chr&gt; | Education_Level &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| Boy  | 1-5   | School     |  14 |\n",
       "| Boy  | 11-15 | School     | 211 |\n",
       "| Boy  | 16-20 | College    |  76 |\n",
       "| Boy  | 16-20 | School     |  24 |\n",
       "| Boy  | 16-20 | University |   9 |\n",
       "| Boy  | 21-25 | College    |  12 |\n",
       "| Boy  | 21-25 | University | 253 |\n",
       "| Boy  | 26-30 | University |  42 |\n",
       "| Boy  | 6-10  | School     |  22 |\n",
       "| Girl | 1-5   | School     |  67 |\n",
       "| Girl | 11-15 | School     | 142 |\n",
       "| Girl | 16-20 | College    | 121 |\n",
       "| Girl | 16-20 | School     |  21 |\n",
       "| Girl | 16-20 | University |  27 |\n",
       "| Girl | 21-25 | College    |  10 |\n",
       "| Girl | 21-25 | University |  99 |\n",
       "| Girl | 26-30 | University |  26 |\n",
       "| Girl | 6-10  | School     |  29 |\n",
       "\n"
      ],
      "text/plain": [
       "   Gender Age   Education_Level n  \n",
       "1  Boy    1-5   School           14\n",
       "2  Boy    11-15 School          211\n",
       "3  Boy    16-20 College          76\n",
       "4  Boy    16-20 School           24\n",
       "5  Boy    16-20 University        9\n",
       "6  Boy    21-25 College          12\n",
       "7  Boy    21-25 University      253\n",
       "8  Boy    26-30 University       42\n",
       "9  Boy    6-10  School           22\n",
       "10 Girl   1-5   School           67\n",
       "11 Girl   11-15 School          142\n",
       "12 Girl   16-20 College         121\n",
       "13 Girl   16-20 School           21\n",
       "14 Girl   16-20 University       27\n",
       "15 Girl   21-25 College          10\n",
       "16 Girl   21-25 University       99\n",
       "17 Girl   26-30 University       26\n",
       "18 Girl   6-10  School           29"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df %>%\n",
    "    group_by(Gender, Age, Education_Level) %>%\n",
    "    count()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "81b4ce48",
   "metadata": {
    "papermill": {
     "duration": 0.007767,
     "end_time": "2022-06-02T15:20:34.273721",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.265954",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "อยากรู้ว่าเด็กที่เป็น IT Student ทั้งหมดกี่คน"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "6ecf95af",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:34.294023Z",
     "iopub.status.busy": "2022-06-02T15:20:34.292170Z",
     "iopub.status.idle": "2022-06-02T15:20:34.318763Z",
     "shell.execute_reply": "2022-06-02T15:20:34.316761Z"
    },
    "papermill": {
     "duration": 0.039105,
     "end_time": "2022-06-02T15:20:34.321122",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.282017",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df_IT <- df %>%\n",
    "    group_by(IT_Student) %>%\n",
    "    count()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "ea2af8d6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:34.341603Z",
     "iopub.status.busy": "2022-06-02T15:20:34.339940Z",
     "iopub.status.idle": "2022-06-02T15:20:34.362187Z",
     "shell.execute_reply": "2022-06-02T15:20:34.360524Z"
    },
    "papermill": {
     "duration": 0.034496,
     "end_time": "2022-06-02T15:20:34.364369",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.329873",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>IT_Student</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>No </td><td>901</td></tr>\n",
       "\t<tr><td>Yes</td><td>304</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " IT\\_Student & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t No  & 901\\\\\n",
       "\t Yes & 304\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 2\n",
       "\n",
       "| IT_Student &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| No  | 901 |\n",
       "| Yes | 304 |\n",
       "\n"
      ],
      "text/plain": [
       "  IT_Student n  \n",
       "1 No         901\n",
       "2 Yes        304"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df_IT"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "8bfb89fb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:34.384894Z",
     "iopub.status.busy": "2022-06-02T15:20:34.383135Z",
     "iopub.status.idle": "2022-06-02T15:20:34.652394Z",
     "shell.execute_reply": "2022-06-02T15:20:34.650512Z"
    },
    "papermill": {
     "duration": 0.281825,
     "end_time": "2022-06-02T15:20:34.654522",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.372697",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nVJWnp7zw8svPP3TrdeOH7DJ69AHrF3xklkWusYOvVtpjjdOP3PjlG079y/TmjpXatQe3Nb/7\n8Ix5HXfz7fP++H5jn+/3K96MQKFVrbBdam+6Z3pb5WcqJp552riHPmp45fYrrrpl1bW+u+Me\n+584+pwLD1/j+buuKfawLCucsYOlsvJWI3e6fd9b/zq1crmUUqpaYfi2fe+67MSzs4fv1rc6\n9+fbLn+1tfcZewg7WIaU9/zuIev3ufbEsZWH7Taob82U+66645Vpp524fNmsuXfcfsOc6rof\nfG/1TOOHd056v3qVnYs9LMsKYQdLKbPvGcfdP2Ls/A++lhx54Tk9x11+5bmnzcqVrDJww+PP\nO3JIle+1gmXLj069sPnyS35/2dkzWstW6b/u8WeNWr+mLNXsPfqgWdfcdc1JN8yprq1ffd1t\nf3nkT4o9KcuKTD6f/+q9AADo8lxjBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQ\nwg7olppnPpTJZFbe5O6U0v079Mss0a3T5i7NY+bbG2+68OStvj94uV7V5VW9vz1g8J4/PeXh\nd+Z8g2PPevuUTCazz2vTv8HHBFjAX54Aur1+ux1+wpAZHbfbW6de8Kvrqpbf5cj9ByzYYWCP\nr/6jIPn2pp9tOuCSxz9eaegO+xy604q9y9594+lbf/vft1x9zUV/fe7o9fp07Db1r6ccPPa5\nkyfcMqxXeWf8Lkupi4wBdDXCDuj2Bh78n+fOv93a+OwFv7quZuWDzj33R//Ug7x1616XPP7x\nJv9152On/3DB4gVnP/S9gduN3Hr4EZ/cW5pJKaWmjx6/884HD2xt+6aG/3q6yBhAV+OtWICU\nUnr5gqdSShf8YtuFF6tW3vK3IwbOnfanP3y6VG/mdo78vNb24j070J0IO4CUUqqsK08p/WHK\nl69+22DsnS+++OK2dRUppV+uVrvazg+mlHatr+q16siU0shVe3XcWGDKmA0zmcxbzZ+dS3vy\nxv/e5rur96ws77PSwL2OvWhqyxcSbc7bk4/ba7tvf6u2onq5QUO3GjN+0oLNN65V37vfqR8+\ndOkG/ep6lGer+/T9/vYH3P9e4yLHAOjgrViAlFIaMmq3NOn8i7Ye8u5hR+624w5bbbFRn4ps\nSqm8brXBdZ/ts/e1t67ywH8ccPqUU27+ny2WX/MrH/P5cXttdPRNlX2G7n3of9Tn3vvjb0du\n9Ei/BVsbP7h9/bX2eCfTd58DD129Pvvcw78ffcQPb3/s6mevHdGxQ8usR7+3w+T+exx54bBB\nnz5/zznjr99pg09nTb3rnx0DWIbkAbqheQ0PppRW2njSl9Zb5jyTUlp+/Tu+xmM+9ttR66/a\ns+O1sSTbc+jmO/7ijIuf+MfMhff5x+1bpZRu+bSp4+4vVunZc5VfLLzDs6M3SCn9Y14uN/eN\n5cuzVSvs+OKslo5Nc957YM2qspTS8Fen5fP50YP7lFWt9dincxf87G3Hr59SGvv3hnw+f8Og\nPiml749++POte/RPKf1pxrz/OwZAB2/FAnxmk4PGPvvOzLdfeOzqX43d50ffm/rsvef+18++\n37/P9sde9TUe7ZNnTp7a0vbv144b3POzz+RW993q+iMHddzONb10xsvTB/302k36VC74kR+c\n+quU0k2/eb3jbkm26raTN1uwdb09+qWUZre53g5YLGEHsLDMt4dsMuJno667/YH3GmY9edeV\nm69Qfu/FB4+4971/9oGm/u9bKaW9NqhfeHHAgUM7bsybfndbPv/C+Rst/H17FbWbp5RmvjCz\nY5/SqiErlX/+Kp3p+FwuwOK5xg4gtTW/s9tex668xZnjjl3789VMxXd/cPAfH2vs3f/YP41+\nLm23ytI8VL4933GjpLQkpVTyxRgrqZx/vV5JeUppnZFXnbvVyl96hIre63/2/Jmv/vo9gIUJ\nO4CULV/xsUl3NE8ZNO7Ys760qbx3/5RS+XKVi/q5Dl/4MrmPn/rsc7Xf2my1lJ64ccq03bf5\nvAg/euDJjhuVy/0gmzku17DmdtsNW7A1N/fVW/7nuRXXq/pXfhdgWeatWICUMuWX/PDbM9/6\n730uejC/8Hq+5cojj0sp7TF2vS8sz9+pKlsyb/pdn87/nrl50/5y5IPvd9yuX/es5cuzfzrg\n2Ncacx0rLTOfO2LkMx23SytXH732cm9cf8ADHzUteNgbjtpp7733fmepX5jz+a/eB1imOGMH\nkFJKP5n4wPDvbjjx51s/8NvNdth0/W/1qmya/uETD93x5N9nrn/g5ecM/exSubKeZSmly399\nZfNaGw3f6/s/3m+NMWOfXG+r/Ufuu1XrR69ec8GvPq4vT+/lUkrZytXuO+8n6/3s90NX22S/\nfbdfPn185zXXz9x4eLrns49iHDfp0ivW2GeHAUN22evHGw5c7sUHb7r+vtfXGXH9fst/9Rm7\nL43RWf9RgG6n2B/LBfg6OuPrTtpzM28878TtN1n7W7U12Wx57/pVh/37Hhfe8Of2Lzz+lB9t\n8J3KbOlK647J5/PtbY2XHL/3mv1WLMtkUkp9/23/Rx/bIaX0j3m5jv3/MuHMLYf2r6ko7Vm/\n6q5HXTJ7zstp/ted5PP5htfuOXznzVesrSmvWm7Q+puedsXdrfOf7IZBfSp6/dvC4y38FSdf\nGgOgQybvVD7Av6y9edZ7n+S+vcpyxR4EWKYJOwCAIFxjB8T31m0/GnrQn5ewQ0XvzT966/aC\nzQPQSZyxAwAIwtedAAAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAE\nIewAAIL4//OmDPJTVMk/AAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = df_IT, mapping = aes(x = IT_Student, y = n )) + \n",
    "    geom_col(width = 0.2) + \n",
    "    scale_fill_manual(values = c(\"skyblue\", \"royalblue\")) +\n",
    "    theme_minimal() "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d0112707",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T14:36:03.804883Z",
     "iopub.status.busy": "2022-06-02T14:36:03.803251Z",
     "iopub.status.idle": "2022-06-02T14:36:03.987302Z"
    },
    "papermill": {
     "duration": 0.008633,
     "end_time": "2022-06-02T15:20:34.671714",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.663081",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- จะเห็นว่าคนที่เป็นเด็ก IT นั่นเมื่อเทียบกับคนที่ไม่ใช่มีน้อยอยู่มากคือประมาณ 1 ใน 3"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3d0f40a6",
   "metadata": {
    "papermill": {
     "duration": 0.009329,
     "end_time": "2022-06-02T15:20:34.690168",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.680839",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- ต่อมาอยากรู้ว่าเมื่อแยกกันแล้วคนที่เป็นเด็ก IT เมื่อเทียบกับเด็กธรรมดาแล้ว Adaptivity Level เป็นอย่างไรบ้าง"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "44d7dc6b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:34.711743Z",
     "iopub.status.busy": "2022-06-02T15:20:34.709838Z",
     "iopub.status.idle": "2022-06-02T15:20:34.728875Z",
     "shell.execute_reply": "2022-06-02T15:20:34.727040Z"
    },
    "papermill": {
     "duration": 0.031969,
     "end_time": "2022-06-02T15:20:34.730962",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.698993",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Moderate'</li><li>'Low'</li><li>'High'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Moderate'\n",
       "\\item 'Low'\n",
       "\\item 'High'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Moderate'\n",
       "2. 'Low'\n",
       "3. 'High'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Moderate\" \"Low\"      \"High\"    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "unique(df$Adaptivity_Level)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6746ef9c",
   "metadata": {
    "papermill": {
     "duration": 0.008791,
     "end_time": "2022-06-02T15:20:34.749377",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.740586",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- สัดส่วนแยกระหว่างคนที่เป็นเด็ก IT กับไม่เป็น"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "8c1a3dc1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:34.769442Z",
     "iopub.status.busy": "2022-06-02T15:20:34.767721Z",
     "iopub.status.idle": "2022-06-02T15:20:34.833771Z",
     "shell.execute_reply": "2022-06-02T15:20:34.831910Z"
    },
    "papermill": {
     "duration": 0.078473,
     "end_time": "2022-06-02T15:20:34.836035",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.757562",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'IT_Student'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>IT_Student</th><th scope=col>Adaptivity_Level</th><th scope=col>n_count</th><th scope=col>proportion</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>No </td><td>High    </td><td> 67</td><td>0.07</td></tr>\n",
       "\t<tr><td>No </td><td>Low     </td><td>391</td><td>0.43</td></tr>\n",
       "\t<tr><td>No </td><td>Moderate</td><td>443</td><td>0.49</td></tr>\n",
       "\t<tr><td>Yes</td><td>High    </td><td> 33</td><td>0.11</td></tr>\n",
       "\t<tr><td>Yes</td><td>Low     </td><td> 89</td><td>0.29</td></tr>\n",
       "\t<tr><td>Yes</td><td>Moderate</td><td>182</td><td>0.60</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " IT\\_Student & Adaptivity\\_Level & n\\_count & proportion\\\\\n",
       " <chr> & <chr> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t No  & High     &  67 & 0.07\\\\\n",
       "\t No  & Low      & 391 & 0.43\\\\\n",
       "\t No  & Moderate & 443 & 0.49\\\\\n",
       "\t Yes & High     &  33 & 0.11\\\\\n",
       "\t Yes & Low      &  89 & 0.29\\\\\n",
       "\t Yes & Moderate & 182 & 0.60\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 6 × 4\n",
       "\n",
       "| IT_Student &lt;chr&gt; | Adaptivity_Level &lt;chr&gt; | n_count &lt;int&gt; | proportion &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| No  | High     |  67 | 0.07 |\n",
       "| No  | Low      | 391 | 0.43 |\n",
       "| No  | Moderate | 443 | 0.49 |\n",
       "| Yes | High     |  33 | 0.11 |\n",
       "| Yes | Low      |  89 | 0.29 |\n",
       "| Yes | Moderate | 182 | 0.60 |\n",
       "\n"
      ],
      "text/plain": [
       "  IT_Student Adaptivity_Level n_count proportion\n",
       "1 No         High              67     0.07      \n",
       "2 No         Low              391     0.43      \n",
       "3 No         Moderate         443     0.49      \n",
       "4 Yes        High              33     0.11      \n",
       "5 Yes        Low               89     0.29      \n",
       "6 Yes        Moderate         182     0.60      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df %>%\n",
    "    group_by(IT_Student, Adaptivity_Level) %>%\n",
    "    summarise(n_count = n()) %>%\n",
    "    mutate(proportion = round(proportions(n_count), 2))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3417803d",
   "metadata": {
    "papermill": {
     "duration": 0.008711,
     "end_time": "2022-06-02T15:20:34.854266",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.845555",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- สัดส่วนรวมระหว่างคนที่เป็นเด็ก IT กับ ไม่เป็น"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "cf102cf7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:34.875662Z",
     "iopub.status.busy": "2022-06-02T15:20:34.873774Z",
     "iopub.status.idle": "2022-06-02T15:20:34.935657Z",
     "shell.execute_reply": "2022-06-02T15:20:34.933582Z"
    },
    "papermill": {
     "duration": 0.075348,
     "end_time": "2022-06-02T15:20:34.938153",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.862805",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'IT_Student'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>IT_Student</th><th scope=col>Adaptivity_Level</th><th scope=col>n_count</th><th scope=col>proportion</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>No </td><td>High    </td><td> 67</td><td>0.06</td></tr>\n",
       "\t<tr><td>No </td><td>Low     </td><td>391</td><td>0.32</td></tr>\n",
       "\t<tr><td>No </td><td>Moderate</td><td>443</td><td>0.37</td></tr>\n",
       "\t<tr><td>Yes</td><td>High    </td><td> 33</td><td>0.03</td></tr>\n",
       "\t<tr><td>Yes</td><td>Low     </td><td> 89</td><td>0.07</td></tr>\n",
       "\t<tr><td>Yes</td><td>Moderate</td><td>182</td><td>0.15</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " IT\\_Student & Adaptivity\\_Level & n\\_count & proportion\\\\\n",
       " <chr> & <chr> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t No  & High     &  67 & 0.06\\\\\n",
       "\t No  & Low      & 391 & 0.32\\\\\n",
       "\t No  & Moderate & 443 & 0.37\\\\\n",
       "\t Yes & High     &  33 & 0.03\\\\\n",
       "\t Yes & Low      &  89 & 0.07\\\\\n",
       "\t Yes & Moderate & 182 & 0.15\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| IT_Student &lt;chr&gt; | Adaptivity_Level &lt;chr&gt; | n_count &lt;int&gt; | proportion &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| No  | High     |  67 | 0.06 |\n",
       "| No  | Low      | 391 | 0.32 |\n",
       "| No  | Moderate | 443 | 0.37 |\n",
       "| Yes | High     |  33 | 0.03 |\n",
       "| Yes | Low      |  89 | 0.07 |\n",
       "| Yes | Moderate | 182 | 0.15 |\n",
       "\n"
      ],
      "text/plain": [
       "  IT_Student Adaptivity_Level n_count proportion\n",
       "1 No         High              67     0.06      \n",
       "2 No         Low              391     0.32      \n",
       "3 No         Moderate         443     0.37      \n",
       "4 Yes        High              33     0.03      \n",
       "5 Yes        Low               89     0.07      \n",
       "6 Yes        Moderate         182     0.15      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df %>%\n",
    "    group_by(IT_Student, Adaptivity_Level) %>%\n",
    "    summarise(n_count = n()) %>%\n",
    "    ungroup() %>%\n",
    "    mutate(proportion = round(proportions(n_count), 2))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "78951efb",
   "metadata": {
    "papermill": {
     "duration": 0.008897,
     "end_time": "2022-06-02T15:20:34.957540",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.948643",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "- น่าแปลกใจที่คนที่เป็นเด็ก IT แต่ Adaptivity_Level โดยรวมนั้นน้อยกว่าคนที่ไม่ได้เป็นเด็ก IT"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "9c2bc80c",
   "metadata": {
    "_kg_hide-input": false,
    "execution": {
     "iopub.execute_input": "2022-06-02T15:20:34.980443Z",
     "iopub.status.busy": "2022-06-02T15:20:34.978334Z",
     "iopub.status.idle": "2022-06-02T15:20:35.330067Z",
     "shell.execute_reply": "2022-06-02T15:20:35.327884Z"
    },
    "papermill": {
     "duration": 0.365485,
     "end_time": "2022-06-02T15:20:35.332304",
     "exception": false,
     "start_time": "2022-06-02T15:20:34.966819",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'IT_Student'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJCrKPYFOUCgUMpnMtGnTyj2RTpPP50MIhUIhpo1iETgASq1D\neziTybRza3wLUaFQKF6IaaO6lbY9PH369CRJyjuZKLXt4ZkzZ0azh9tfiEIcYRdCSKVSVVVV\n5Z5Fp8lms7lcLkmSmDaKReAAKLUO7eFUqr0fcSRJEt9ClM1mg+OwZHK5XNsejiY7upV8Pl/c\nw5WVle0/fxcjC9yQGMIuSZJ0Ol1bW1vuiXSa5ubmlpaWEEJMG8UicACUWof2cDqdXuAdYvqS\ntbS0WIhKKpPJNDc3hxBqamqiyY5uJZvNNjU1hRCqq6srKmIInrAQC5EjCQAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBIVXfaZWqf/+/rLbnjypTeb0/UrrrLWbof9cIuVGkIIIeQfGX/VvY899/6M9JC1\nNz3gmANXratodxwAgHnosjN2hatOPOvJz5b74Rnn/2TkcUPSr1108mmfZfIhhLfuPGPs7U9t\ntuuhZx+/X8ObD4084dp8CO2MAwAwT10Udi3THv7rpNkHn3vU5uusMXjohgedfkqu5f3bP50d\nCq1jbp8waK9Ru2+/+dCNtjruwqNnfXT/rRNnzXccAID56KKwS1X0O+igg77Wo2rO9aQihFCX\nTrVMe+y95tywYQOKw9W9ttygoerZRz6e33jXzBYAYHHURa9aq6xfd5dd1g0hND7/9HMfffTc\nQ3cuPfR7+y5T1/ThiyGEteoq2+65Zl3FfS9Oa9123uNh7zlXx4wZ8+ijjxYv19fXL7PMMo2N\njV2zLV2gUCgU/41po1gEDoBS69AezmQy7dxaKBQymUxMX7LiQhQch6U3bdq0ck8hTm3H8PTp\n05MkKe9kOkv7C1Hoyl+eKPrkib/e95+J777btPmuK4cQ8i2zQgh9K/534rBfZTo7s3l+421X\np0yZMnHixOLlnj17Lr300rlcrku2oEtFuVEsPAdAqXVoD7d9k2jnDlF+yaLcqG7FHi61fD6e\nV+kvcCHq6rAbcvSPfh7C7A//cfjRF5zbf61Th9SGEBqz+YZ0uniHyZlculdVqmre422Ps/XW\nWy+77LJtV99+++3a2tqu24wSy2azmUwmSZKamppyz4Vyiumo7p46tIfT/12O5ilJknQ6HdOX\nLJfLtba2BsdhyeTz+ZaWlhBCTU1NNOeTupW2PVxdXZ1KRfL+bu0vRKHLwm76fx5//M3q73xz\n0+LVuuU3/V6fmj/e/3HlRuuE8NjrTdkVqudM9I2mbM8te1XWz3u87QF32GGHHXbYoXi5sbHx\nggsuqK+v75pt6QLNzc3Fc60xbRSLwAFQah3awwtcT9PpdExfspaWlmLYxbRR3UomkylmR11d\nXTTZ0a1ks9niHq6tra2oiOQd0xa4EHXRkZRpevS6a8YW398khBAKuVdmZ+tWrKvp9fXlq9L3\nPzFpzt1mPf+PGa0bbr/c/Ma7ZrYAAIujLgq73kMOH1TVcvpPbnj25df/M+GF2y875fmm6n32\nWTUkVScPH/Kfm8558NnXP3rr5RvPuriu/3b7DWyY7zgAAPPRRWcmU5VLjx7z46uuHXfxqPuz\nlT1WXHnI8T89a4ve1SGE1fYcfVTLJePHnjW5ORm03jajRx1ajM35jQMAME9d9yPnugEbnzxq\n43nckKSH7X/SsP0XehwAgHlxFgwAIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASFeWeQCcoFAqZTGbq1Knl\nnkinKRQKxX9j2igWgQOg1Dq0hzOZTDu3xroQBcdhybTt4enTp5d3JrFq28MzZsxIkqS8k+ks\n7S9EIY6wCyGkUqmamppyz6LTZDKZXC6XJElMG8UicACUWof2cCrV3o84kiSJbCHKZrO5XC44\nDksml8s1NTWFEKqrq6PJjm5l7j3c/vN3MbLADYkh7JIkSafTkS09LS0twXq6xHMAlFqH9nA6\nnV7gHWL6krW0tDQ3NwfHYclkMpn4sqNbyWazxT1cVVVVURFD8ISFWIgcSQAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACRWNiw23zzzS/6YOaXxz9+8titvrFvp04JAIBFUdH+zdPf/s9H\nrbkQwt///vdVJ0x4fdZSn7+98PIfH3vy8XdKNTsAABbaAsLuzh2/dtC/pxQvj9th03Hzus9S\nK/+ws2cFAECHLSDs/m/UmGumNocQjjjiiG3OG7vX0rVfuEOqssfmuw0v1ewAAFhoCwi7Nfbc\nf40QQgjjx4/f5aBDDl++oQvmBADAIlhA2LV5+OGHQwhTPnjr01mZL9+6xhprdOakAADouIUN\nu+bPHtxtyz3/9PqUed5aKBQ6b0oAACyKhQ2763be989vzPjukafvuO7KFUlJpwQAwKJY2LAb\n/cynq+75u3uv2qmkswEAYJEt1BsUF3IzPs3kVtpz3VLPBgCARbZQYZekG7btVfPWTf8s9WwA\nAFhkC/knxZLxfziv9c/7HHDezZ/MypZ2RgAALJKFfY3d8NN/v2z/ypvPOuCWsw/us9xytenP\n/QLF+++/X4K5AQDQAQsbdv369evXb/uV1i/pZAAAWHQLG3Z33XVXSecBAMBXtLBhN23atHZu\n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\nVEZTtueWveY33vZoW2+99dZbb1283NjY+Oqrr9bW1nbZtpRac3NzcT2NaaNYBA6AUuvQHl7g\neppOp2P6krW0tFiISiqTyRTDrqamJprs6Fay2Wwx7KqrqysqInnHtAUuRF10JBXys88/7arq\n7Y696qzD2qouhFDT6+vLV6Xvf2JS8Wpm1vP/mNG64fbLzW+8a2YLALA46qKAnT3p1ldnZw5c\np+7Zf/7zf5+7drX1h/Y6efiQU24658H+pw7tnbnnyovr+m+338CGEML8xgEAmKcuCrsZ/3kn\nhPDLn50/9+BSK/z411duttqeo49quWT82LMmNyeD1ttm9KhDi2cR5zcOAMA8dVHYLbfl+fds\nOZ/bkvSw/U8atv9CjwMAMC/OggEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEoqLcEwAAFlcjRowo9xQWe+PGjevER3PGDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBIV5Z5AJygUCplMZurUqeWeSKcpFArFf2PaKBaBA6DUOrSHM5lMO7fGuhAFx2HJtO3h6dOn\nl3cmlFcnLkQhjrALIaRSqZqamnLPotNkMplcLpckSUwbxSJwAJRah/ZwKtXejziSJIlsIcpm\ns7lcLjgOSyaXyzU1NYUQqqurkyQp93Qom05ciEIcYZckSTqdjmzpaWlpCdbTJZ4DoNQ6tIfT\n6fQC7xDTl6ylpaW5uTk4Dksmk8m0hd0Cv1sTsc5diBxJAACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkajo\n+k9505H714y65gdL1/53IP/I+Kvufey592ekh6y96QHHHLhqXUW74wAAzEMXn7ErvPH49Xd9\nODVbKLQNvXXnGWNvf2qzXQ89+/j9Gt58aOQJ1+bbHQcAYJ667hzYpKcuOe3yJybPbP3caKF1\nzO0TBu110e7bDwohrHZhsvt+F9468YB9l6+c9/iA+i6bMADA4qXrztj1Grr7yFE/vehnp809\n2DLtsfeac8OGDShere615QYNVc8+8vH8xrtstgAAi52uO2NXtdSA1ZYKudaauQdbZ70YQlir\nrrJtZM26ivtenNa67bzHw95zrp5//vkPPfRQ8XKPHj1WXnnlyZMnl3gLulqhUIhvo+gQB0Cp\ndWgPt7a2tnNroVBobW2N8ksW5UZ1K42NjeWeAuXUiQtRKMsvT8wt3zIrhNC34n8nDvtVprMz\nm+c33na1qalp+vTpxctJkoQQCnO9bi8aUW4UC88BUGqdvoej/JJFuVHdij28hOvcA6DMYZeq\nqg0hNGbzDel0cWRyJpfuVTW/8bYP3GGHHQYPHly8nM/nX3rppfr6eF5+l81mW1pakiSpq6sr\n91wop5iO6u6pQ3s4/d/laJ6SJEmn0zF9yYoLUXAclkwul2tubg4h1NXVFc9QsGTqxIUolD3s\nKuvXCeGx15uyK1TPmegbTdmeW/aa33jbB2699dZbb7118XJjY+Orr75aW1sbYtHc3FxcT2Pa\nKBaBA6DUOrSHF7ieptPpmL5kLS0tFqKSymQyxbCrqalJpbyt7JKrcxeiMh9JNb2+vnxV+v4n\nJhWvZmY9/48ZrRtuv9z8xss3UwCA7q7c/0VIqk4ePuQ/N53z4LOvf/TWyzeedXFd/+32G9gw\n33EAAOaj/H/LYbU9Rx/Vcsn4sWdNbk4GrbfN6FGHptodBwBgnro67NJVA++5557PDSXpYfuf\nNGz/L911fuMAAMyLs2AAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEo/9+KBYASGTFiRLmnsNgbN25cuadABzhjBwAQCWEHABAJYQcAEAlhBwAQCWEH\nABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJ\nYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABCJinJPoGxGjBhR7iks3saNG1fuKQAAn+OM\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJCrKPYFOUCgUMplMY2NjuSeyZLHDu4CdXGod2sOZTKadW+NbiAqF\nQvFCTBvFInAAlFonLkQhjrALIaTT6bq6unLPYslih3cBO7nUOrSH0+l0O7cmSRLZQpTNZpua\nmoLjcInnACi1TlyIQhxhlyRJKpWqrq4u90SWLHZ4F7CTS61DeziVWsBrV2JdiKLcKBaeA6DU\nOnkh+mqTAQCguxB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACRqCj3BACWXCNGjCj3FBZv48aNK/cUoHtxxg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASFeWeQDvyj4y/\n6t7Hnnt/RnrI2psecMyBq9Z159kCAJRZ9z1j99adZ4y9/anNdj307OP3a3jzoZEnXJsv95QA\nALqz7hp2hdYxt08YtNeo3bfffOhGWx134dGzPrr/1omzyj0tAIDuq5uGXcu0x95rzg0bNqB4\ntbrXlhs0VD37yMflnRUAQHfWTV+11jrrxRDCWnWVbSNr1lXc9+K0sPecq2ecccZ9991XvNyz\nZ8+11177s88+6/JpLtHs8C5gJ5dah/Zwa2trO7cWCoXW1lZfsi5mh3cBO7nUOnEhCt32jF2+\nZVYIoW/F/6bXrzKdndlcvhkBAHR33fSMXaqqNoTQmM03pNPFkcmZXLpXVdsddt555w033LB4\nOZvN/v3vf29oaOjQp7jxxhs7abKdL5PJtLS0JElSX19f7rksuu68h3O5XFNTUwihvr4+SZJy\nT2cRdec9nM/nZ8+eHUKoq6tLpbrpfyA7Kv3f5WiekiRJp9MxLUTZbLa5uTmE0NGN6la68x62\nEJVa2x5echai0G3DrrJ+nRAee70pu0L1nA14oynbc8tebXfYZJNNNtlkk+LlxsbGZ555pqam\npgwTLZmWlpYQQmQb1X20trYWn+01NTWL73ranWWz2WLYVVdXL3AZWlwscEPS6XRMz9mWlpZi\n2MW0Ud1KJpMpLkTV1dXRZEe3ks1mi3u4qqqqoqKbBk9HLXAh6qZHUk2vry9flb7/iUnFq5lZ\nz/9jRuuG2y9X3lkBAHRn3TTsQlJ18vAh/7npnAefff2jt16+8ayL6/pvt9/AxfjHAQAApdZ9\nz0yutufoo1ouGT/2rMnNyaD1thk96tDuGqEAAN1C9w27kKSH7X/SsP3LPQ0AgMWEs2AAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkago9wQ6xyuvvHL66aeXexadJpfLZbPZJEmqqqrKPZc45fP5TCYT\nQqiuri73XOJUKBRaW1tDCFVVVUmSlHs6neOVV15Z4B1iWog8TUqtbQ/H9DTpVpbMhSiSsJs0\nadKDDz5Y7lkA8ausrJzfTRYioGu0sxAlhUKhK6dSCoVCYcaMGeWeRWe69957x44dW11d/ec/\n/7ncc4nTE088cdZZZ4UQ/vCHP9TV1ZV7OhGaMGHCD3/4wxDCzTffvMIKK5R7Op2purp6nmew\n4luI/vKXv/z0pz8NIfz1r38t91zi9Oyzz55yyikhhDvuuKNv377lnk6E3nrrrUMOOSSEcN11\n16222mrlnk5nmt9CFOI4Y5ckyVJLLVXuWXSmmpqaEON2dR9tMdejR4/6+vryTiZKbXu1oaFh\nCTmM43vC1tbWFi9Etl3dx9wLkZ1cCg0NDcUL9fX1S84e9ssTAACRiOGMXXwGDhy4/fbb+82J\n0llmmWW23377EEJFhadASSy11FLFPewn3Yuv/v37F7+IlEifPn2Ke9hqXyINDQ3FPdyjR49y\nz6XrxPAaOwAAgh/FAgBEQ9gBAERC2HW1Ow75wb7HP/OFwWeO3/cHB99avLzTTjvd+Mnsdh5h\n/113uXhiVO+q0OmuPWCPg895odyzWGycudfwnXba6ZaJM78w/vzPD9tpp52Ouf7fHXq0Ww/+\nwQm3vfXVZzXzow8+amz96o/DPFmIuoCFqEMsRJ1F2HU73/rWt4bUekU/XSpJJ4/f8vl1s5D9\n5TOfpcv3Xu2Pn3Pq6PGdsC6zaCxEdD0LUacQdt3OkUce+X9L+Q0putSyX1/3s+eub53rV6lm\nfXjbe/l+2/Qs4d+SyrXMKt2D8xVZiOh6FqJO4T9k3c7wnXf+9nW3HbRsXa75vZsuvf6pF19t\nqu7/7QNOfO3qUwaOvfnw5epDCPls480/Oe/Pz72Rquu32Y4HHbvX5uWe9eIh1zLx11de9/A/\nJ0zLpFYcvMHwQ4/aapUeNx30gydWPvX6szYMIbw1/oTjx735rStuPXLFHiGEy/ff46WhZ1x3\n6rrlnnjJLbXSfunHT/3VezMPXmnOmwL8+9eP91nnkNq3L2q7zzz3Xgih+bMXrrtq/POvvdFU\nsfSWO+3f67/3L2Sn3Hn9dY/96/WJja3LD1p3l/0P225I7xDCiO/vPOK6GybdOPbhl2t/9asz\nWqe9dsOVNz/14pvTW/P9ll/tm3sdvfsWA689YI8/TmkOH526+9+2uOPXp83voSgdC1HpWIjm\nx0LUKZyxK4Nc8/sTPu/95tyX7lW4/uQf/fWjXoedev5pR3z/pV+c+ursTNttz553Zth4+EWX\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "df %>%\n",
    "    group_by(IT_Student, Adaptivity_Level) %>%\n",
    "    summarise(Count = n()) %>%\n",
    "    ggplot(mapping = aes(x = Adaptivity_Level, y = Count)) + \n",
    "    geom_col() + \n",
    "    theme_bw() +\n",
    "    facet_wrap(~IT_Student)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "3d2577ca",
   "metadata": {
    "papermill": {
     "duration": 0.010424,
     "end_time": "2022-06-02T15:20:35.353513",
     "exception": false,
     "start_time": "2022-06-02T15:20:35.343089",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "ed181bbc",
   "metadata": {
    "papermill": {
     "duration": 0.010278,
     "end_time": "2022-06-02T15:20:35.373991",
     "exception": false,
     "start_time": "2022-06-02T15:20:35.363713",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 9.363751,
   "end_time": "2022-06-02T15:20:35.508035",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-06-02T15:20:26.144284",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
