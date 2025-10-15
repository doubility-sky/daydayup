[Freqtrade](https://www.freqtrade.io/) is a free and open source crypto trading bot written in Python.
It is designed to support all major exchanges and be controlled via Telegram or webUI.
It contains backtesting, plotting and money management tools as well as strategy optimization by machine learning.

- https://github.com/freqtrade

- [[blockchain]]
- [[finance]]
  - [[trading]]


## Learn
- [Official Documentation](https://www.freqtrade.io/en/stable/) - Comprehensive guide to installation, configuration, and strategy development
- [Quickstart with Docker](https://www.freqtrade.io/en/stable/docker_quickstart/) - How to quickly set up Freqtrade using Docker

### blogs
- [Bot Academy](https://botacademy.ddns.net/)
- [Saber2pr's Blog](https://saber2pr.top/)
  - github [repo](https://github.com/Saber2pr/saber2pr.github.io/tree/master/Web3), [zh-CN](https://github.com/Saber2pr/zh/tree/master/Web3)


## [Configuration](https://www.freqtrade.io/en/stable/configuration/)
- [Exchange-specific Notes](https://www.freqtrade.io/en/stable/exchanges/) - Information on supported exchanges and their specific configurations


## [Strategies](https://www.freqtrade.io/en/stable/strategy-101/)
- [Strategy Customization](https://www.freqtrade.io/en/stable/strategy-customization/) - Learn how to create custom trading strategies
- [Hyperopt](https://www.freqtrade.io/en/stable/hyperopt/) - How to optimize your trading strategies using hyperparameter optimization
- [Advanced Strategies](https://www.freqtrade.io/en/stable/strategy-advanced/) - Advanced strategy techniques including reinforcement learning

### examples
- [Example Strategies](https://github.com/freqtrade/freqtrade-strategies) - Collection of strategies for Freqtrade
- [NostalgiaForInfinity](https://github.com/iterativv/NostalgiaForInfinity) - Trading strategy for the Freqtrade crypto bot. For backtesting results, check out the comments in the individual commit page.


## [Backtesting](https://www.freqtrade.io/en/stable/backtesting/)
- [Data Downloading](https://www.freqtrade.io/en/stable/data-download/) - Obtaining historical data for backtesting
- [Assumptions made by backtesting](https://www.freqtrade.io/en/latest/backtesting/#assumptions-made-by-backtesting)
- :warning:[Backtest Traps](https://brookmiles.github.io/freqtrade-stuff/2021/04/12/backtesting-traps/)
  - [Trailing Stoploss](https://botacademy.ddns.net/2023/07/09/backtest-traps-trailing-stoploss/)
    - The bot mostly gonna check profit based of high value, then in case of a long green candle, you might exit near the high, especially if you set a very tight trailing.
    - [FSD – Trailing stoploss](https://botacademy.ddns.net/2023/10/18/fsd-trailing-stoploss/)
  - [Custom Exit](https://botacademy.ddns.net/2023/07/09/backtest-traps-custom-exit/)
    ```py
    def custom_exit(self, pair: str, trade: Trade, current_time: datetime, current_rate: float, current_profit: float, **kwargs) -> Optional[Union[str, bool]]:
        dataframe, _ = self.dp.get_analyzed_dataframe(pair, self.timeframe)
        current_candle = dataframe.iloc[-1].squeeze()
        current_profit = trade.calc_profit_ratio(current_candle['close'])
    ```
    - The snippet above will make sure your current_profit tied to last closed candle’s close rate, ensuring that your backtesting results are consistent with live trading results.
    - [FSD – Custom exit](https://botacademy.ddns.net/2023/10/18/fsd-custom-exit/)
  - [ROI](https://botacademy.ddns.net/2023/07/12/backtest-traps-roi/)
    - Using time intervals that correspond to your timeframe will help you avoid falling into the ROI trap.
  - [Backtest in batches](https://botacademy.ddns.net/2024/10/10/hidden-trap-of-doing-backtest-in-batches/)
    - Can you avoid such issue while still doing backtest in batches? Sure, if your average trade duration is very short.
- [Improved backtest accuracy](https://www.freqtrade.io/en/develop/backtesting/#improved-backtest-accuracy)
- [Analyzing Results](https://www.freqtrade.io/en/stable/plotting/) - Visualizing and analyzing backtest results


## Control the Bot
- [Telegram Integration](https://www.freqtrade.io/en/stable/telegram-usage/) - Control your bot via Telegram messaging
- [Freqtrade REST API](https://www.freqtrade.io/en/stable/rest-api/) - API for programmatic interaction
- [Webhook Notifications](https://www.freqtrade.io/en/stable/webhook-config/) - Send trade notifications to external services


## FAQs
- [Got resolution-too-deep error when updating the version from 2025.5 to 2025.6 (or 2025.7)](https://github.com/freqtrade/freqtrade/issues/12057)
  - active venv then `uv pip install -U -r requirements.txt`


## Resources
- [GitHub topic of Freqtrade tag](https://github.com/topics/freqtrade)
