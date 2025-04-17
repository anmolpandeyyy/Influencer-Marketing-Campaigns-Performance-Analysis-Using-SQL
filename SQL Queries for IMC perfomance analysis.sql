/* SQL queries for creating tables

CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    platform VARCHAR(50),
    followers INT,
    country VARCHAR(50)
);

CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    brand VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10, 2)
);

CREATE TABLE campaign_performance (
    performance_id INT PRIMARY KEY,
    campaign_id INT,
    influencer_id INT,
    views INT,
    likes INT,
    comments INT,
    clicks INT,
    conversions INT,
    platform VARCHAR(50),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id),
    FOREIGN KEY (influencer_id) REFERENCES influencers(influencer_id)
);

CREATE TABLE revenue (
    conversion_id INT PRIMARY KEY,
    campaign_id INT,
    revenue_generated DECIMAL(12, 2),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);

/* Total Budget spent per brands

SELECT brand, SUM(budget) AS total_budget
FROM campaigns
GROUP BY brand
ORDER BY total_budget DESC;

/* Top 5 influencers by total Views
SELECT i.name, SUM(cp.views) AS total_views
FROM campaign_performance cp
JOIN influencers i ON cp.influencer_id = i.influencer_id
GROUP BY i.name
ORDER BY total_views DESC
LIMIT 5;

/* Campaign wise engagement rate

SELECT 
    cp.campaign_id,
    c.brand,
    ROUND(SUM(cp.likes + cp.comments) * 100.0 / NULLIF(SUM(cp.views), 0), 2) AS engagement_rate
FROM campaign_performance cp
JOIN campaigns c ON cp.campaign_id = c.campaign_id
GROUP BY cp.campaign_id, c.brand;

/* CTR by campaign
SELECT 
    campaign_id,
    ROUND(SUM(clicks) * 100.0 / NULLIF(SUM(views), 0), 2) AS ctr_percentage
FROM campaign_performance
GROUP BY campaign_id;

/*Conversion rate by platform
SELECT 
    platform,
    ROUND(SUM(conversions) * 100.0 / NULLIF(SUM(clicks), 0), 2) AS conversion_rate
FROM campaign_performance
GROUP BY platform;

/* ROI per campaign
SELECT 
    c.campaign_id,
    c.brand,
    c.budget,
    r.revenue_generated,
    ROUND(r.revenue_generated - c.budget, 2) AS profit,
    ROUND((r.revenue_generated - c.budget) * 100 / NULLIF(c.budget, 0), 2) AS roi_percentage
FROM campaigns c
JOIN revenue r ON c.campaign_id = r.campaign_id;

/* Influencer Performance Summary (views, likes, CTR)
SELECT 
    i.name,
    i.platform,
    SUM(cp.views) AS total_views,
    SUM(cp.likes) AS total_likes,
    ROUND(SUM(cp.clicks) * 100.0 / NULLIF(SUM(cp.views), 0), 2) AS ctr
FROM influencers i
JOIN campaign_performance cp ON i.influencer_id = cp.influencer_id
GROUP BY i.name, i.platform
ORDER BY total_views DESC;

/* Best Performing Platform by Average Conversion Rate
SELECT 
    platform,
    ROUND(AVG(conversions * 100.0 / NULLIF(clicks, 0)), 2) AS avg_conversion_rate
FROM campaign_performance
GROUP BY platform
ORDER BY avg_conversion_rate DESC;

