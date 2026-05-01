Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF1bBnG39GmvDwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 16:23:45 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 944294AD343
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 16:23:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C94B23F774
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 14:23:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id BC2113F774
	for <greybus-dev@lists.linaro.org>; Fri,  1 May 2026 14:23:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=xwZn88Qd;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48A31600CB;
	Fri,  1 May 2026 14:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7C1C2BCB4;
	Fri,  1 May 2026 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777645418;
	bh=C38Er74XKF4RgZEEadR7CSfurscBgx/4MvgfZolh7JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xwZn88Qd8gfu6gt8S8L+6ac9NrLAfwpz+Pa6rH+vz+pYZL6hOmY+iIYkySAvJMZTo
	 0JZ00waj296/EFTO+M7UrnFBVkZbaL6+DaFfj7Q9HW70wu27SxXy2Dg8G2c/d8B7yt
	 wGVRP8PXBgcQdRK737RAc/aV20v08IpWkkBMzoHU=
Date: Fri, 1 May 2026 16:23:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Message-ID: <2026050120-statistic-absinthe-b3ab@gregkh>
References: <20260501141620.24411-1-shyamsunderreddypadira@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260501141620.24411-1-shyamsunderreddypadira@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: LUQTYZJRM3LEO2PVIZXD74BV57TOTIHS
X-Message-ID-Hash: LUQTYZJRM3LEO2PVIZXD74BV57TOTIHS
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus:add missing newline in sysfs show() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LUQTYZJRM3LEO2PVIZXD74BV57TOTIHS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 944294AD343
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]

On Fri, May 01, 2026 at 07:46:17PM +0530, Shyam Sunder Reddy Padira wrote:
> Sysfs show() functions should return newline-terminated
> strings.Add missing newline to sysfs_emit() format string.
> 
> No functional changes.

that is a very functional change :(
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
