Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E898FFF7
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Oct 2024 11:41:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 18F5C41014
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Oct 2024 09:41:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	by lists.linaro.org (Postfix) with ESMTPS id 9D3D840F33
	for <greybus-dev@lists.linaro.org>; Fri,  4 Oct 2024 09:41:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b="LV/fBpl7";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=none (lists.linaro.org: domain of sakari.ailus@linux.intel.com has no SPF policy when checking 192.198.163.17) smtp.mailfrom=sakari.ailus@linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034912; x=1759570912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cQO4yxO5Mf/gJoqJB7Yak/F6CuWujliYGcPrKVuKzPI=;
  b=LV/fBpl79vSkpMFF8HQI03UgPCjr0nLGtMsk6APGeiKX9iPO1XIH1noX
   wmVvl7FrDflWyZZ6619rZaX+xBBSFAyztf5eopFAxLELrR7kBatsCCqzF
   xNLE4GRYG3Chhgj0RJ6/7x7/yNwH80Kt1Le2S7irO9omxc5exYV3OfiCF
   mMCs++DFnSM6zvBkckXP0VS+KOA+eQC+5bQpWFm+bo5KjsSv9b5ig0feH
   jsvOo667Ll19gLUQNso8lfwgbdGkhKn0xMUFD7QKK7tI2PUoPaaNEYIbI
   h2SccO7uiDMLVYbScYta/YVLqN5gCT/Ooyetc3MRzo3MGJw9h2tL6KYbR
   A==;
X-CSE-ConnectionGUID: bk8hWq7DRnuYdUv/DL5qgQ==
X-CSE-MsgGUID: oouMLJPOQT+AITC2j7ugFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136212"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800";
   d="scan'208";a="27136212"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:51 -0700
X-CSE-ConnectionGUID: zNg/XBz3SmC7pCcqmKhiRQ==
X-CSE-MsgGUID: GsSoo2YWRsmg2DGu7ZnKSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800";
   d="scan'208";a="105492091"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6F9D8120E8F;
	Fri,  4 Oct 2024 12:41:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoj-000ThM-1P;
	Fri, 04 Oct 2024 12:41:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri,  4 Oct 2024 12:41:45 +0300
Message-Id: <20241004094145.114150-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9D3D840F33
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.30 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	R_SPF_NA(0.00)[no SPF record];
	ASN(0.00)[asn:4983, ipnet:192.198.162.0/23, country:US];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: 36TA32AGRSH6HQBFPSUUM74TJ34TJCHZ
X-Message-ID-Hash: 36TA32AGRSH6HQBFPSUUM74TJ34TJCHZ
X-MailFrom: sakari.ailus@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 47/51] staging: greybus: Switch to __pm_runtime_put_autosuspend()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/36TA32AGRSH6HQBFPSUUM74TJ34TJCHZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/linux/greybus/bundle.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/greybus/bundle.h b/include/linux/greybus/bundle.h
index df8d88424cb7..c23709c3426f 100644
--- a/include/linux/greybus/bundle.h
+++ b/include/linux/greybus/bundle.h
@@ -64,7 +64,7 @@ static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
 	int retval;
 
 	pm_runtime_mark_last_busy(&bundle->dev);
-	retval = pm_runtime_put_autosuspend(&bundle->dev);
+	retval = __pm_runtime_put_autosuspend(&bundle->dev);
 
 	return retval;
 }
-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
