Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 26519AF8A2C
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Jul 2025 09:55:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 452FC43BFB
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Jul 2025 07:55:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lists.linaro.org (Postfix) with ESMTPS id 6AC523F6E3
	for <greybus-dev@lists.linaro.org>; Fri,  4 Jul 2025 07:55:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=eUt5wGUe;
	spf=none (lists.linaro.org: domain of sakari.ailus@linux.intel.com has no SPF policy when checking 198.175.65.11) smtp.mailfrom=sakari.ailus@linux.intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615704; x=1783151704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mdM0fCBRCMeIMAVi7fqCrM0fXAuMJVicckxaZNS+bgI=;
  b=eUt5wGUeGn6622824sxB5ETzQY2qCBLTqs+Q8WW2lUofQU5kYc1omlbu
   Z6Y94zVPX26tQoYf/PBBheAJj9COBupAlRr130GN8bfldfnIc74MZBs0h
   G1vna2hiLrA0G17LpmhRM1POWmQUdP3YDXrpdPiMbLELWOKpV8TBFqXlg
   z4yRVEvq9leedRNbaYQidphUqbTQCoyh5dEwCh06WFJQ0FT5JNCnNwQ30
   ZQHRZzPZn+BJasHftcfPs/W+wz8aKxUyYkc3i1HGlLEgQ8338u6LXyH7I
   mbfz244RD6hcSlzssjLVOyz9Ex8yAJDOeZrDvavkRB2SNm7r7/Rdti5Dr
   w==;
X-CSE-ConnectionGUID: g0JhXAC7RRCKPTEAq4lXsw==
X-CSE-MsgGUID: 1ombainsRCGsDZqJemNA+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194259"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600";
   d="scan'208";a="64194259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
X-CSE-ConnectionGUID: LhFiReD2SIile6uLjhnPyQ==
X-CSE-MsgGUID: o0jYIUk4SJePdq14auC1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600";
   d="scan'208";a="158616652"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:51 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 4B87844419;
	Fri,  4 Jul 2025 10:54:49 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri,  4 Jul 2025 10:54:48 +0300
Message-Id: <20250704075448.3221843-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6AC523F6E3
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.30 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	DWL_DNSWL_BLOCKED(0.00)[intel.com:dkim];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:4983, ipnet:198.175.64.0/23, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	URIBL_BLOCKED(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_NA(0.00)[no SPF record];
	DNSWL_BLOCKED(0.00)[198.175.65.11:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: NGRFW5EEARL6QOZ7C3SUH23HHGLRHGLV
X-Message-ID-Hash: NGRFW5EEARL6QOZ7C3SUH23HHGLRHGLV
X-MailFrom: sakari.ailus@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 62/80] staging: greybus: Remove redundant pm_runtime_mark_last_busy() calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NGRFW5EEARL6QOZ7C3SUH23HHGLRHGLV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/staging/greybus/gbphy.c | 1 -
 drivers/staging/greybus/gbphy.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6adcad286633..3068bd71cd98 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -53,7 +53,6 @@ static void gbphy_dev_release(struct device *dev)
 #ifdef CONFIG_PM
 static int gb_gbphy_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 	return 0;
 }
diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..4a4ebc7f2b98 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -85,7 +85,6 @@ static inline void gbphy_runtime_put_autosuspend(struct gbphy_device *gbphy_dev)
 {
 	struct device *dev = &gbphy_dev->dev;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
