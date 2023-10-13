// Pass the repo name
const recipe = "create-a-topshot-play";

//Generate paths of each code file to render
const contractPath = `${recipe}/cadence/contract.cdc`;
const transactionPath = `${recipe}/cadence/transaction.cdc`;

//Generate paths of each explanation file to render
const smartContractExplanationPath = `${recipe}/explanations/contract.txt`;
const transactionExplanationPath = `${recipe}/explanations/transaction.txt`;

export const createATopShotPlay= {
  slug: recipe,
  title: "Create a TopShot Play",
  createdAt: Date(2022, 3, 1),
  author: "Flow Blockchain",
  playgroundLink:
    "https://play.onflow.org/15c1e86e-010c-4a7c-bcfd-98a1bddc36a7?type=tx&id=2b1db24f-95fa-44fa-8a7c-149e47c5c226&storage=none",
  excerpt:
    "Using the TopShot contract, this is how you would create a Play to start adding them to your sets and mint moments out of them.",
  smartContractCode: contractPath,
  smartContractExplanation: smartContractExplanationPath,
  transactionCode: transactionPath,
  transactionExplanation: transactionExplanationPath,
};

