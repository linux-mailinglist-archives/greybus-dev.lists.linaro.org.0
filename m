Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E40DED3A4EC
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Jan 2026 11:25:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EB3DB3F7FD
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Jan 2026 10:25:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 022F73F6FF
	for <greybus-dev@lists.linaro.org>; Mon, 19 Jan 2026 10:25:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=ROMsEPb5;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6249343870;
	Mon, 19 Jan 2026 10:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CFFC116C6;
	Mon, 19 Jan 2026 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768818318;
	bh=XwUFOlmPTX8t/w/823hNtlsLv0UTd8nRYhCdV/EQ1sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROMsEPb5XFkmHpB5o/wZHKEMppwUnkvkiIaf5EwJL2q9aMTqUD9c3D6VEHLyugRjJ
	 +m3G3BWSLCRyhEG+BW/7dOCdJ3IybiqyAfoE44vI4OOy0A0uHqvD/DcIlt0ed2ldFs
	 +vIfaArg7tkTk1gkyoaq/wsNUS6YFFTUoIPndMo4Ozcvvc0Sm/jU8R+A7+esl/+1Ej
	 B07L8kep+xeGK7dTqQ53lC0jHHK4tTC/6fIuu/mgG2boqOSbAtaqtq5lDYl6aW6MU7
	 3VaKWTgoIf0KawzBdRkbK/tDdKBAtX605w4qwUTRidF7hnv0ySMLcdgMYJFsH8FoSk
	 m2tm36ICOUBtQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vhmRb-000000000Q1-0gwX;
	Mon, 19 Jan 2026 11:25:11 +0100
Date: Mon, 19 Jan 2026 11:25:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Archit Anant <architanant5@gmail.com>
Message-ID: <aW4Ghy94jAGSPml3@hovoldconsulting.com>
References: <20260118060548.24548-1-architanant5@gmail.com>
 <20260118060548.24548-2-architanant5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118060548.24548-2-architanant5@gmail.com>
X-Rspamd-Queue-Id: 022F73F6FF
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,172.234.252.31:from];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: D7OBSR3J6CWEKQ46JJ6MYDNK2S427S6M
X-Message-ID-Hash: D7OBSR3J6CWEKQ46JJ6MYDNK2S427S6M
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] staging: greybus: fw-core: use %pe for error printing
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D7OBSR3J6CWEKQ46JJ6MYDNK2S427S6M/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[ +CC: Julia ]

On Sun, Jan 18, 2026 at 11:35:48AM +0530, Archit Anant wrote:
> Use the %pe printk format specifier to print error codes as symbolic
> names (e.g., -ENOMEM) instead of numeric values. This improves
> readability of error logs.

Greybus and this driver uses numerical errnos in its error messages so
this will introduce a needless inconsistency for no good reason.

> Issue identified by coccicheck using the ptr_err_to_pe.cocci script.

Also see:

	https://lore.kernel.org/all/20251029132922.17329-1-johan@kernel.org/

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
