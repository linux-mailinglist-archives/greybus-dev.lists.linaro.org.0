Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 23835A904DC
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 15:51:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4030C43D10
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 13:51:26 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 5EC3743D10
	for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 13:51:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=MEl9mE9Q;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C61D0A49FA7;
	Wed, 16 Apr 2025 13:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3115C4CEE2;
	Wed, 16 Apr 2025 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744811478;
	bh=+wx2sC6I5mlk2PyZ3qWyksEMyQYV4JAGVPjVJfE7+BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEl9mE9Qz65zZEEe8CDmj9B6yMm90nyYxYB1fVvAbVMgHg0kDt3s6ZyDiANWHezbt
	 QuNgb+QTfKC5QV2PWG7PDwuJVrBwxACR3GLyHs+c8R0H/gm+x0sRSqRmpzsdW15Zl+
	 AsiYHsCZfVqMhrdlUYXlcF5H2GMvFlmQ2UvBl5oSKUCFhKs25BvSmTnQ7WlP3Myysd
	 NU33Wj0GcjPVOLn7WI0VzeQFwnAs5wx7LL3HA3LASrBZ93J/MAWJGmKCtJ58Ux2Sbx
	 3nykTBsgwSsXb2GJIpPbFlrim4T13lyKzAWQF6XQHfp86awEzmO8QEgkAujQqpSd7+
	 zhnsyDOllKTFw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u53Ab-000000002BI-28Ur;
	Wed, 16 Apr 2025 15:51:17 +0200
Date: Wed, 16 Apr 2025 15:51:17 +0200
From: Johan Hovold <johan@kernel.org>
To: rujra <braker.noob.kernel@gmail.com>
Message-ID: <Z_-11fvQJtiwAxaA@hovoldconsulting.com>
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
X-Rspamd-Queue-Id: 5EC3743D10
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.98%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: TISMGDU3MU5UJ7UGKD5ZV4H4JVXKTWWS
X-Message-ID-Hash: TISMGDU3MU5UJ7UGKD5ZV4H4JVXKTWWS
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: ayushdevel1325@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the checks as first-patch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TISMGDU3MU5UJ7UGKD5ZV4H4JVXKTWWS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 16, 2025 at 05:47:41PM +0530, rujra wrote:
> added comments on spinlocks for producer-consumer model, rearranged the
> lines on function calls where it should not end with "(" this bracket,
> also removed white-spaces and aligned the arguments of function calls.
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

You're doing too many things in one patch, the patch is white space
damaged, and the patch prefix is wrong since this driver does not live
in staging.

If you want to practise creating patches, please make sure to work in
drivers/staging where changes like these may be accepted. 

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
