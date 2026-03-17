Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I2BB2xfuWmrCgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Mar 2026 15:04:28 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E789A2AB66F
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Mar 2026 15:04:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F049A3F76C
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Mar 2026 14:04:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 3413E3F760
	for <greybus-dev@lists.linaro.org>; Tue, 17 Mar 2026 14:04:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=UwRpm8q4;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1998600CB;
	Tue, 17 Mar 2026 14:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7364CC4CEF7;
	Tue, 17 Mar 2026 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756259;
	bh=WSMrHeA7v6TncmzeDTIFtykB5hNRm5aobkhygNs37eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwRpm8q4RYhEqLjc35fsqkEvklLdeJ3eLm8W18bvsbnXB7UfNaXW2AnrwkAkRri5+
	 3J3T7isHIlKqHjLAMiU4kkX+N/RJoia5zZD9A4uyrc6FyCkK2NYIrIxTzZX+8hk0EA
	 YHrnARB7blDIltj+9Fsk6suqCoZzli7OjkiNF4v9mseHSUa3ZYIL5NzHfsnQYRMcbi
	 ZMBSB7/Lm3dhwAVNkYn6Q28/i5x4C5/0wynHUB6dmCRWrS6wrncBJfPsCo3kssZ+EG
	 Joy5b8ISBfTrlIywV+liIfHGiboWPSk1aw4YBiqJsYXyC3vl2RX6rni2In2OhwoW9e
	 GheY9rbkFMtYg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2V1t-0000000011t-0q81;
	Tue, 17 Mar 2026 15:04:17 +0100
Date: Tue, 17 Mar 2026 15:04:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <ablfYXR7i1nRiaA9@hovoldconsulting.com>
References: <03573ebb-54af-4bd0-9730-5f55d24ae0c9@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03573ebb-54af-4bd0-9730-5f55d24ae0c9@web.de>
X-Spamd-Bar: ----
Message-ID-Hash: RVC3TN6YS5ZBRBB3IX6IOLMQOHKBVOK6
X-Message-ID-Hash: RVC3TN6YS5ZBRBB3IX6IOLMQOHKBVOK6
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Omit a redundant pm_runtime_mark_last_busy() call in two functions()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RVC3TN6YS5ZBRBB3IX6IOLMQOHKBVOK6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.49 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FREEMAIL_CC(0.00)[lists.linaro.org,kernel.org,vger.kernel.org,gmail.com,ideasonboard.com,intel.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[web.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[linaro.org:query timed out];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[linaro.org:query timed out];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RBL_SEM_FAIL(0.00)[44.210.186.118:query timed out];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.888];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: E789A2AB66F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 04:05:23PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Mar 2026 16:00:20 +0100
> 
> The device's last busy timestamp was set in a wrapper function since
> the commit 18c1fe53d186867243f4cf17f4eef60737a16c4c ("PM: runtime:

nit: 12 char hash is enough and reads better

> Mark last busy stamp in pm_request_autosuspend()").
> Thus delete a pm_runtime_mark_last_busy() call before
> two pm_request_autosuspend() calls.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
