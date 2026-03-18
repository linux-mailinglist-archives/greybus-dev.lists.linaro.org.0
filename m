Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAsQJzxYumnFUgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 08:46:04 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43B2B726A
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 08:46:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B15B2401F7
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 07:46:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id EC9763F786
	for <greybus-dev@lists.linaro.org>; Wed, 18 Mar 2026 07:46:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=hGTsFQt+;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FDF96011F;
	Wed, 18 Mar 2026 07:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF83C19421;
	Wed, 18 Mar 2026 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773819960;
	bh=wQvuTHyqS56/urxeNzTnjQ3G3nxnbgixJTiXZ7b8LKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGTsFQt+aWXH+wCtbwzjhr8fgZi8/5RTA4VNN2mmhusR6s5RGjr3aTxI1X177SafO
	 ecywhsZJSQiQV5JvnVLT/COb8AOIx408XccG5rdEZl0fqtVdJU+C1xFVIQboQtInRD
	 6AEIq47chHYtVq+rv5yDv3zSbCpCxRVDgKIfC39TolNWdy1JmlBWrNGIXODy27eIG+
	 n0rxsmpPArPysx9U2ZaaxWXBsh/fh1ogSc40ERPiiZNtakz9T2YkCSFvefxb2l0uw2
	 +tVmlmAuMnN4ZRN8Lcy19T7TmWFaxqUdgNDlNG5l5eWtLjU1ox3sqqrPb4M5tx+DDM
	 gSen28Keej2cw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2lbJ-000000004en-2b4z;
	Wed, 18 Mar 2026 08:45:57 +0100
Date: Wed, 18 Mar 2026 08:45:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Message-ID: <abpYNRYOM_Er80HU@hovoldconsulting.com>
References: <20260317211651.8098-1-rayfraytech@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317211651.8098-1-rayfraytech@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: XRUBBTQRCCGSEB6JX52F2VCBHCNC6U3T
X-Message-ID-Hash: XRUBBTQRCCGSEB6JX52F2VCBHCNC6U3T
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC in uart.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XRUBBTQRCCGSEB6JX52F2VCBHCNC6U3T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.951];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 2C43B2B726A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:16:51PM +0100, Oskar Ray-Frayssinet wrote:
> Replace deprecated DEFINE_IDR and idr_* functions with the modern
> DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>

The proposed change has already been rejected. For example, see:

	https://lore.kernel.org/all/2026020735-thumping-chemicals-c76e@gregkh/

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
