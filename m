Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D79E98E
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 15:36:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B4F1A60EFF
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 13:36:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9DEE361805; Tue, 27 Aug 2019 13:36:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D99BA61731;
	Tue, 27 Aug 2019 13:36:30 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B9BBD60EFB
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 13:36:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AB5BC616FC; Tue, 27 Aug 2019 13:36:28 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by lists.linaro.org (Postfix) with ESMTPS id 932D360EFB
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 13:36:27 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RDYd2V195703;
 Tue, 27 Aug 2019 13:36:22 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2un551g73h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 13:36:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RDXrFQ121925;
 Tue, 27 Aug 2019 13:36:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2umhu8rpgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 13:36:21 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7RDaKSZ008735;
 Tue, 27 Aug 2019 13:36:20 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Aug 2019 06:36:20 -0700
Date: Tue, 27 Aug 2019 16:36:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190827133611.GE23584@kadam>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-1-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908270146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908270146
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 0/9] staging: move greybus core out of
	staging
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

SSBjYW4ndCBjb21waWxlIGdyZXlidXMgc28gaXQncyBoYXJkIHRvIHJ1biBTbWF0Y2ggb24gaXQu
Li4gIEkgaGF2ZSBhClNtYXRjaCB0aGluZyB3aGljaCBpZ25vcmVzIG1pc3NpbmcgaW5jbHVkZXMg
YW5kIGp1c3QgdHJpZXMgaXRzIGJlc3QuCkl0IG1vc3RseSBnZW5lcmF0ZXMgZ2FyYmFnZSBvdXRw
dXQgYnV0IGEgY291cGxlIG9mIHRoZXNlIGxvb2sgbGlrZQpwb3RlbnRpYWwgaXNzdWVzOgoKZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvb3BlcmF0aW9uLmM6Mzc5IGdiX29wZXJhdGlvbl9tZXNzYWdl
X2FsbG9jKCkgd2FybjogY2hlY2sgJ21lc3NhZ2Vfc2l6ZScgZm9yIGludGVnZXIgb3ZlcmZsb3dz
ICdremFsbG9jKCknCmRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmM6MTI1NiBnYl9saWdo
dHNfcmVxdWVzdF9oYW5kbGVyKCkgd2FybjogJ2xpZ2h0LT5jaGFubmVscycgZG91YmxlIGZyZWVk
CmRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmM6MTI1NiBnYl9saWdodHNfcmVxdWVzdF9o
YW5kbGVyKCkgd2FybjogJ2xpZ2h0LT5uYW1lJyBkb3VibGUgZnJlZWQKCnJlZ2FyZHMsCmRhbiBj
YXJwZW50ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
